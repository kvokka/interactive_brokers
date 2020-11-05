# frozen_string_literal: true

java_import "com.ib.client.EClient"

module InteractiveBrokersProxy
  # This is the Ruby representation of the IB Java +EClient+ class. It adapts ruby invocations
  # and arguments to invoke the corresponding Java API methods.
  #
  # Mimicking how the Java API works, it collaborates with an {IbWrapperAdapter} that
  # corresponds with an +EWrapper+ in the Java world. It works by observing callbacks
  # in this wrapper.
  #
  # Client only proxy all methods to JAVA so responce management is fully on the developer
  #
  class Client
    attr_reader :proxy_service

    def initialize(proxy_service)
      @proxy_service = proxy_service
    end

    delegate :client_socket, :logger, to: :proxy_service

    # generate methods forwarder to JAVA socket only if it was not defined earlier
    # rubocop:disable Metrics/MethodLength
    def self.create_java_methods
      EClient.java_class.declared_instance_methods.each do |java_method|
        ruby_method_name = java_method.name.underscore
        next if respond_to?(ruby_method_name)

        class_eval <<-RUBY, __FILE__, __LINE__ + 1
          def #{ruby_method_name}(*arguments)
            client_socket.#{java_method.name} *arguments.map(&:to_ib)
            logger.debug "Received '#{ruby_method_name}' with arguments \#{ruby_arguments.inspect}"
            nil
          end
        RUBY
      end
    end
    # rubocop:enable Metrics/MethodLength

    create_java_methods
  end
end
