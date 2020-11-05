# frozen_string_literal: true

require_relative "wrapper"
require_relative "client"

java_import "com.ib.client.EReader"
java_import "com.ib.client.EClientSocket"

module InteractiveBrokersProxy
  class ProxyService
    DEFAULT_GATEWAY_HOST = "localhost"
    DEFAULT_GATEWAY_PORT = 4002
    DEFAULT_CLIENT_ID = 2

    attr_reader :gw_host, :gw_port, :client_id, :logger

    # @param [String] gw_host Hostname for the IB client app (gateway or TWS). Default +localhost+
    # @param [Integer] gw_port Port for hte IB client app (gateway or TWS). Default +4002+ (gateway)
    def initialize(**options)
      @gw_host   = options[:gw_host]   || ENV["GATEWAY_HOST"]      || DEFAULT_GATEWAY_HOST
      @gw_port   = options[:gw_port]   || ENV["GATEWAY_PORT"]      || DEFAULT_GATEWAY_PORT
      @client_id = options[:client_id] || ENV["GATEWAY_CLIENT_ID"] || DEFAULT_CLIENT_ID
      @logger    = options[:logger]    || default_logger
    end

    delegate :client_socket, to: :wrapper

    # Start background jobs & return client, which is ready to accept the messages.
    # @return [Client]
    def start
      connect
      start_gw_message_processing_thread
      puts "Interactive Brokers proxy server started. Connected at #{ib_host}:#{ib_port}"
      self
    end

    # Check the connection with the gateway. Do not mess with internet connection
    # Even if internet became down we might be still connected with gateway
    # @return [Boolean]
    def connected?
      !!client_socket.isConnected
    end

    # +EClient+ JAVA class instance, which allows to send java methods to the gateway
    # @return [Client]
    def client
      @client ||= Client.new(self)
    end

    private

    delegate :signal, to: :wrapper

    def start_gw_message_processing_thread
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

    def reader
      @reader ||= EReader.new(client_socket, signal).tap(&:start)
    end

    def wrapper
      @wrapper ||= Wrapper.new(self)
    end

    def connect
      client_socket.eConnect(gw_host, gw_port, client_id)
    end

    def default_logger
      require "logger"
      Logger.new(STDOUT)
    end
  end
end
