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

    attr_reader :proxy_service, :signal, :client_socket

    def initialize(proxy_service)
      @proxy_service = proxy_service
      @signal = EJavaSignal.new
      @client_socket = EClientSocket.new(self, @signal)
    end

    delegate :logger, to: :proxy_service

    # generate stubs for all callbacks for easier development
    def self.create_java_methods
      EWrapper.java_class.declared_instance_methods.each do |java_method|
        ruby_method_name = java_method.name.underscore
        next if respond_to?(ruby_method_name)

        class_eval <<-RUBY, __FILE__, __LINE__ + 1
            def #{java_method.name}(*arguments)                                                               # def ContractDetails(*arguments)
              ruby_arguments = arguments.map(&:to_ruby)                                                       #   ruby_arguments = arguments.map(&:to_ruby)
              logger.info "Received callback '#{ruby_method_name}' with arguments \#{ruby_arguments.inspect}" #   logger.info "Received callback 'contract_details' with arguments \#{ruby_arguments.inspect}"
            end                                                                                               # end
        RUBY
      end
    end

    create_java_methods
  end
end
