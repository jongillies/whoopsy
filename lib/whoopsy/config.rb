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

    file_name = 'whoopsy.yml'
    global_config_file = "/etc/#{file_name}"
    local_config_file = "#{File.join(ENV['HOME'],".#{file_name}")}"
    environment_file = ENV['WHOOPSY_CONFIG']

    # Load in order of priority
    load_file global_config_file
    load_file local_config_file
    load_file environment_file

    private

    def load_file

    end

  end
end

