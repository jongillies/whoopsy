require 'yaml'
require 'logger'


module Whoopsy
  CONFIG_OPTIONS = [:host,
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


    def initialize

      @config = {}

      @file_name = 'whoopsy.yml'
      @global_config_file = "/etc/#{@file_name}"
      @local_config_file = "#{File.join(ENV['HOME'],".#{@file_name}")}"
      @environment_file = ENV['WHOOPSY_CONFIG']

      # Load in order of priority
      load_file @global_config_file
      load_file @local_config_file
      load_file @environment_file if @environment_file

    end

    private

    def load_file(file_name)
      begin
        @config.merge! YAML::load_file(file_name)
      rescue Errno::ENOENT
        $stderr.puts "WARNING: #{file_name} does not exist"
      end

    end

  end
end

