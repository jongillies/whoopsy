require 'whoopsy/version'
require 'trollop'
require 'shellwords'

module Whoopsy
  class GemName
    attr_reader :cli_arg
    def initialize(args={})
      opts = Trollop::options(args) do

        banner "#{Whoopsy::VERSION_BANNER}\n\n#{Whoopsy::HELP_TEXT}"
        version Whoopsy::VERSION_BANNER
        opt :verbose, 'Verbose output.', short: 'v'
        opt :debug, 'Display additional debugging information.'
      end
      unless @cli_arg = args[0]
        Trollop::die 'ERROR: You must specify something on the command line.'
      end
      opts
    end
  end
end
