require 'whoopsy/version'
require 'whoopsy/config'
require 'trollop'
require 'whoops_logger'

module Whoopsy

  REQUIRED_ARGS = [:host, :port, :event_type, :service, :environment, :event_group_identifier]

  class Logger

    def initialize(args={})

      opts = Trollop::options(args) do

        banner "#{Whoopsy::VERSION_BANNER}\n\n#{Whoopsy::HELP_TEXT}"
        version Whoopsy::VERSION_BANNER
        opt :verbose, 'Verbose output.', short: 'v'
        opt :debug, 'Display additional debugging information.'

        opt :host, 'Whoops Logger hostname', type: String
        opt :http_open_timeout, 'HTTP open timeout', type: Integer
        opt :http_read_timeout, 'HTTP read timeout', type: Integer
        opt :port, 'Whoops Logger port', type: Integer
        opt :protocol, 'Whoops Logger Protocol', type: String
        opt :proxy_host, 'Proxy Host', type: String
        opt :proxy_pass, 'Proxy Password', type: String
        opt :proxy_port, 'Proxy Port', type: Integer
        opt :proxy_user, 'Proxy Username', type: String
        opt :secure, 'Secure?'

        opt :event_type, 'your_event_type', type: String
        opt :service, 'my_service_name', type: String
        opt :environment, 'development', type: String
        opt :message, 'String to Show in Whoops Event List', type: String
        opt :event_group_identifier, 'String used to assign related events to a group', type: String
        opt :details, 'A string, hash, or array of arbitrary data', type: String

      end

      @config = Whoopsy::Config.new

      # Set the @config attributes based on the opts hash
      Whoopsy::CONFIG_OPTIONS.each do |option|
        eval("@config.#{option} = \"#{opts[option]}\"") if opts["#{option}_given".to_sym]
      end

      check_required_args

      send_message
    end

    private

    def send_message

      WhoopsLogger.config.set(@config.config_hash)

      WhoopsLogger.log('default::basic', {
          event_type: @config.event_type,
          service: @config.service,
          environment: @config.environment,
          message: @config.message,
          event_group_identifier: @config.message,
          details: @config.details
      })

    end

    def check_required_args
      Whoopsy::REQUIRED_ARGS.each do |arg|
        value = eval("@config.#{arg}.to_s.empty?") # This will render a string, if value nil will render ""
        Trollop::die "Must have the following parameters: [#{Whoopsy::REQUIRED_ARGS.join(', ')}], #{arg} is missing." if value
      end
    end

  end
end


