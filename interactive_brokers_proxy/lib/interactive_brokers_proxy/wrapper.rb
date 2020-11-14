# frozen_string_literal: true

java_import "com.ib.client.EWrapper"
java_import "com.ib.client.EJavaSignal"
java_import "com.ib.client.EClientSocket"

module InteractiveBrokersProxy
  # Ruby representation of the IB +EWrapper+ class. It delegates received callbacks by
  # triggering a corresponding channel. It will translate the name of the java method to
  # Ruby (underscore), as well as translate the parameters from IB to Ruby.
  class Wrapper
    include EWrapper
    ERRORS_DETAILS_URL = "https://interactivebrokers.github.io/tws-api/message_codes.html"

    attr_reader :proxy_service, :signal, :client_socket

    def initialize(proxy_service)
      @proxy_service = proxy_service
      @signal = EJavaSignal.new
      @client_socket = EClientSocket.new(self, @signal)
    end

    delegate :logger, to: :proxy_service

    def contractDetails(*args)
      super
      InteractiveBrokersProxy.req_id_registry[args.first] << json(*args)
    end

    def contractDetailsEnd(id)
      super
      InteractiveBrokersProxy.req_id_registry.unregister(id)&.close
    end

    def orderStatus(*args)
      super
      InteractiveBrokersProxy.order_id_registry[args.first] << json(*args)
    end

    # this 2 fuckers must me in common group, cos we can not know order id until it is done
    # def openOrder(*args)
    #   super
    #   InteractiveBrokersProxy.order_id_registry[args.first] << json(*args)
    # end
    #
    # def openOrderEnd(id)
    #   super
    #   InteractiveBrokersProxy.order_id_registry.unregister(id)&.close
    # end

    # rubocop:disable Metrics/MethodLength
    def error(req_id, error_code = nil, error_message = nil)
      super
      payload = {
        error: {
          req_id: req_id,
          from: :gateway,
          code: error_code,
          message: error_message,
          details_url: ERRORS_DETAILS_URL
        }
      }
      logger.error payload
      InteractiveBrokersProxy.req_id_registry[req_id] << json(payload) if req_id.is_a?(Integer) && req_id.positive?
    ensure
      InteractiveBrokersProxy.req_id_registry[req_id].try(:close) if req_id.is_a?(Integer) && req_id.positive?
    end
    # rubocop:enable Metrics/MethodLength

    def nextValidId(id)
      InteractiveBrokersProxy.common_registry[:reqIds] << id
    end

    def json(*payload)
      prepare = payload.map(&:to_ruby).map(&:as_json)
      JSON.dump(prepare.size <= 1 ? prepare.first : prepare)
    end

    module Stubs
      # generate stubs for all callbacks for easier development
      def self.create_java_methods
        EWrapper.java_class.declared_instance_methods.each do |java_method|
          next if instance_methods(false).include?(java_method.name.to_sym)

          class_eval <<-RUBY, __FILE__, __LINE__ + 1
              def #{java_method.name}(*arguments)                                                                       # def ContractDetails(*arguments)
                ruby_arguments = arguments.map(&:to_ruby)                                                               #   ruby_arguments = arguments.map(&:to_ruby)
                logger.debug "Received callback '#{java_method.name}' with arguments \#{ruby_arguments.inspect}"        #   logger.info "Received callback 'contractDetails' with arguments \#{ruby_arguments.inspect}"
              end                                                                                                       # end
          RUBY
        end
      end

      create_java_methods
    end

    include Stubs
  end
end
