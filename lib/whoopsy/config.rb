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
                    :secure,
                    :event_type,
                    :service,
                    :environment,
                    :message,
                    :event_group_identifier,
                    :details]

  class Config

    CONFIG_OPTIONS.each do |var|
      class_eval { attr_accessor var }
    end

    def initialize

      @config = {}

      @file_name = 'whoopsy.yml'
      @global_config_file = "/etc/#{@file_name}"
      @local_config_file = "#{File.join(ENV['HOME'], ".#{@file_name}")}"
      @environment_file = ENV['WHOOPSY_CONFIG']

      # Load in order of priority
      load_file @global_config_file
      load_file @local_config_file
      load_file @environment_file if @environment_file

      CONFIG_OPTIONS.each do |var|
        eval("self.#{var} = \"#{@config[var]}\"")
      end

    end

    # Return a hash of config options for the whoops_logger, making sure the "type" is correct
    def config_hash
      h = {}

      [:host, :protocol, :proxy_host, :proxy_pass, :proxy_port, :proxy_user, :secure].each do |var|
        eval("h[:#{var}] = @#{var} unless @#{var}.empty?")
      end

      [:http_open_timeout, :http_read_timeout, :port].each do |var|
        eval("h[:#{var}] = @#{var}.to_i if @#{var}.to_i > 0")
      end

      h
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