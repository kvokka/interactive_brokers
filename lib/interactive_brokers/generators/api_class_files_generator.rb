# frozen_string_literal: true

require_relative "../../../vendor/TwsApi.jar"
require_relative "class_source_generator"

require "fileutils"
require "pathname"
require "yaml"
require "active_support/core_ext/string/inflections"
require "active_support/core_ext/module/delegation"

module InteractiveBrokers
  module Generators
    # Source code generator that interacts with {ClassSourceGenerator} and writes the
    # actual files with the source for both Ruby classes representing IB classes and Ruby extensions
    # for those.
    class ApiClassFilesGenerator
      class << self
        def config
          @config ||= YAML.load_file(File.join(__dir__, "config.yml"))
        end
      end

      delegate :config, to: :class

      attr_reader :common_code_dir, :server_code_dir, :verbose

      # @param [String] common_code_dir
      # @param [String] server_code_dir
      def initialize(common_code_dir:, server_code_dir:, verbose: true)
        @common_code_dir = Pathname.new(common_code_dir)
        @server_code_dir = Pathname.new(server_code_dir)
        @verbose = verbose

        import_java_classes
      end

      # Generate client files and server class extensions
      #
      # It will format the generated code with {https://github.com/ruby-formatter/rufo Rufo}.
      #
      # @see ClassSourceGenerator#ruby_class_source
      # @see ClassSourceGenerator#ib_class_extension_source
      def generate_all
        prepare_paths
        do_generate_all
        format_code
      end

      private

      def prepare_paths
        FileUtils.mkdir_p common_code_dir, verbose: verbose
        FileUtils.rm common_code_dir.join("*.rb"), verbose: verbose, force: true
        FileUtils.mkdir_p server_code_dir, verbose: verbose
        FileUtils.rm server_code_dir.join("*.rb"), verbose: verbose, force: true
      end

      def import_java_classes
        java_classes.each do |class_name|
          java_import "com.ib.client.#{class_name}"
        end
      end

      def java_classes
        @java_classes ||= config["classes"]
      end

      def do_generate_all
        java_classes.each do |class_name|
          generate_files class_name
        end
      end

      def generate_files(class_name)
        ib_class = Java::ComIbClient.const_get(class_name)
        generator = ClassSourceGenerator.new(ib_class)

        file_name = "#{class_name.underscore}.rb"
        generate_client_file(generator, file_name)
        generate_server_file(generator, file_name)
      end

      def generate_client_file(generator, file_name)
        target_file_path = File.join(common_code_dir, file_name)
        write_file(generator.ruby_class_source, target_file_path)
      end

      def generate_server_file(generator, file_name)
        target_file_path = File.join(server_code_dir, file_name)
        write_file(generator.ib_class_extension_source, target_file_path)
      end

      def write_file(content, target_file_path)
        puts "Generating file: #{target_file_path}..."
        File.open(target_file_path, "w") { |file| file.write(content) }
      end

      def format_code
        [server_code_dir, common_code_dir].each do |dir|
          puts "Formatting #{dir}..."
          system "bundle exec rubocop -A #{dir}"
        end
      end
    end
  end
end
