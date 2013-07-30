#!/usr/bin/env ruby

require 'whoopsy'
require 'trollop'

opts = Trollop::options do
  version "whoopsy #{Whoopsy::VERSION}"
  banner <<-EOS
xxx
Usage:
       whoopsy [options]
where [options] are:
  EOS

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
end

whoopsy = Whoopsy::Config.new()

# Override any options with cli args
Whoopsy::CONFIG_OPTIONS.each do |opt|
  whoopsy.config[opt] = opts[opt] if opts[opt]
end
