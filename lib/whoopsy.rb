require 'whoopsy/version'
require 'trollop'
require 'shellwords'

module Whoopsy
  class GemName
    attr_reader :cli_arg
    def initialize(args={}, version_text='', banner_text='')
      opts = Trollop::options(args) do
        banner = banner_text
        version = version_text
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
