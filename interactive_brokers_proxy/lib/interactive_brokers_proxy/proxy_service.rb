# frozen_string_literal: true

require_relative "wrapper"
require_relative "client"
require "singleton"

java_import "com.ib.client.EReader"
java_import "com.ib.client.EClientSocket"

module InteractiveBrokersProxy
  class ProxyService
    DEFAULT_GATEWAY_HOST = "localhost"
    DEFAULT_GATEWAY_PORT = 4002
    DEFAULT_CLIENT_ID = 2

    include Singleton

    attr_reader :gateway_host, :gateway_port, :client_id, :logger

    class << self
      delegate :connected?, :client, :stop, to: :instance
    end

    # @param [String] gateway_host Hostname for the IB client app (gateway or TWS). Default +localhost+
    # @param [Integer] gateway_port Port for hte IB client app (gateway or TWS). Default +4002+ (gateway)
    # @param [Integer] Interactive brokers client id. Default +2+
    # @param [Logger] Logger instance. Default +Logger.new(STDOUT)+
    def initialize(**options)
      @gateway_host   = options[:gateway_host]    || ENV["GATEWAY_HOST"]      || DEFAULT_GATEWAY_HOST
      @gateway_port   = (options[:gateway_port]   || ENV["GATEWAY_PORT"]      || DEFAULT_GATEWAY_PORT).to_i
      @client_id      = (options[:client_id]      || ENV["GATEWAY_CLIENT_ID"] || DEFAULT_CLIENT_ID).to_i
    end

    delegate :client_socket, to: :wrapper
    delegate :logger, to: :'InteractiveBrokersProxy::Config'

    # Check the connection with the gateway. Do not mess with internet connection
    # Even if internet became down we might be still connected with gateway
    # @return [Boolean]
    def connected?
      !!client_socket.isConnected
    end

    # +EClient+ JAVA class instance, which allows to send java methods to the gateway
    # @return [Client]
    def client
      return @client if defined? @client

      start
      @client = Client.new(self)
    end

    # Clean up all variables & exit background threads
    def stop
      reader.stop
      @client = @wrapper = @reader = nil
    end

    private

    delegate :signal, to: :wrapper

    # Start background jobs & return client, which is ready to accept the messages.
    # @return [Client]
    def start
      return self if connected?

      connect
      start_gw_message_processing_thread
      puts "Interactive Brokers proxy server started. Connected at #{gateway_host}:#{gateway_port}"
      self
    end

    # rubocop:disable Metrics/MethodLength
    def start_gw_message_processing_thread
      reader

      Thread.new do
        while client_socket.isConnected
          signal.waitForSignal
          begin
            reader.processMsgs
          rescue StandardError => e
            logger.error "Error while processing message from gateway: #{e}"
          end
        end
      end
    end
    # rubocop:enable Metrics/MethodLength

    def reader
      @reader ||= EReader.new(client_socket, signal).tap(&:start)
    end

    def wrapper
      @wrapper ||= Wrapper.new(self)
    end

    def connect
      client_socket.eConnect(gateway_host, gateway_port, client_id)
    end

    def default_logger; end
  end
end
