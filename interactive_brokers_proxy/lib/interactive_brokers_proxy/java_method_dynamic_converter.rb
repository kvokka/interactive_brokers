# frozen_string_literal: true

module InteractiveBrokersProxy
  # It should convert args for API method to appropriate format
  #
  # Example:
  #
  #   JavaMethodDynamicConverter.new(:reqAllOrders).convert "5", "params", {foo: 42, "bar": "23"}
  #
  # Doing all requirement conventions in the background
  class JavaMethodDynamicConverter
    class UnsupportedJavaClassError < RuntimeError; end
    class NotFoundError < RuntimeError; end

    attr_reader :api_action, :api_action_name

    def initialize(api_action_name)
      @api_action = self.class.all_actions.find { |m| m.name == api_action_name.to_s.camelcase(:lower) }
      raise(NotFoundError) unless @api_action

      @api_action_name = api_action_name.to_s.underscore
    end

    class << self
      def all_actions
        @all_actions ||= EClient.java_class.declared_instance_methods
      end
    end

    def invoke_java_method(*args)
      InteractiveBrokersProxy::ProxyService.client.public_send(api_action_name, *convert(*args))
    end

    def convert(*args)
      args.flatten.each_with_index.map do |arg, i|
        converter[i].call(arg)
      rescue StandardError => e
        raise $ERROR_INFO, e.message.concat(". Check value at position \"#{i + 1}\""), $ERROR_INFO.backtrace
      end
    end

    private

    def parameters_canonical_names
      api_action.parameter_types.map(&:canonical_name)
    end

    # @return [Array<lambda>] lambda accept an 1 argument, which is current parameter
    # rubocop:disable Metrics/MethodLength
    # rubocop:disable Metrics/AbcSize
    def converter
      @converter ||= parameters_canonical_names.map do |cn|
        case cn
        when "java.lang.String"
          ->(value) { String value }
        when "int", "long"
          ->(value) { Integer value }
        when "double"
          ->(value) { Float value }
        when "boolean", "java.lang.Boolean"
          ->(value) { ![nil, "f", "false", 0, "0", false].include?(value) }
        when /^com\.ib\.client\./
          lambda do |value_hash|
            klass = "InteractiveBrokersCommon::#{cn.split('.').last}".constantize
            klass.new(**value_hash.to_options).tap(&:check_value_types!)
          end
        else
          raise UnsupportedJavaClassError, "Java class '#{cn}' is not supported"
        end
      end
    end
    # rubocop:enable Metrics/MethodLength
    # rubocop:enable Metrics/AbcSize
  end
end
