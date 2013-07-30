require 'yaml'
require 'logger'
require 'active_support/core_ext/hash'


module Whoopsy
  config_options = [:host,
                    :http_open_timeout,
                    :http_read_timeout,
                    :port,
                    :protocol,
                    :proxy_host,
                    :proxy_pass,
                    :proxy_port,
                    :proxy_user,
                    :secure]

  class Config

    attr_accessor :config


    def initialize(args={})

      @logger = args.fetch(:logger) { Logger.new(STDOUT) }

      @config = {}

      @file_name = 'xxwhoopsy.yml'
      @global_config_file = "/etc/#{@file_name}"
      @local_config_file = "#{File.join(ENV['HOME'],".#{@file_name}")}"
      @environment_file = ENV['WHOOPSY_CONFIG']

      # Load in order of priority
      load_file @global_config_file
      load_file @local_config_file
      load_file @environment_file if @environment_file

      puts "asdf"
    end

    private

    def load_file(file_name)
      begin
        @config.reverse_merge! YAML::load_file(file_name)
      rescue Errno::ENOENT => e
        puts "#{file_name} does not exist"
      rescue TypeError
        puts "#{file_name} fuck"

      end

    end

  end
end

