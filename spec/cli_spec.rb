require 'spec_helper'
require 'whoopsy'
require 'shellwords'
require 'yaml'

describe 'Different Command Line Options' do

  it 'should fail with no options' do
    expect { Whoopsy::Logger.new({}) }.to raise_error
  end

  it 'should succeed with required arguments' do
    args = "--event-type 'warning' --service 'my script' --environment 'development' --message 'working ok today' --event-group-identifier 'whats this'"
    expect { Whoopsy::Logger.new(args.shellsplit) }.not_to raise_error
  end

  it 'should fail missing --environment' do
    args = "--event-type 'warning' --service 'my script' --message 'working ok today' --event-group-identifier 'whats this'"
    expect { Whoopsy::Logger.new(args.shellsplit) }.to raise_error
  end

  it 'should spit out help' do
    args = '--help'
    expect { Whoopsy::Logger.new(args.shellsplit) }.to raise_error
  end

  it 'should spit out version' do
    args = '--version'
    expect { Whoopsy::Logger.new(args.shellsplit) }.to raise_error
  end

end

#describe 'Handling --details' do
#
#  it 'should parse --details from the command line' do
#
#    details = { first_name: 'Scooby', last_name: 'Doo', age: 7, friends: %w(Fred Daphne Velma Shaggy) }
#
#    args = "--event-type \"warning\" --service \"my script\" --environment \"development\" --message \"working ok today\" --event-group-identifier \"whats this\" --details \"#{details.to_json}\""
#
#    expect { Whoopsy::Logger.new(args.shellsplit)}.not_to raise_error
#  end
#
#  #it 'should parse --details from a file' do
#  #
#  #  file = 'spec/data/good.json'
#  #  args = "--event-type \"warning\" --service \"my script\" --environment \"development\" --message \"working ok today\" --event-group-identifier \"whats this\" --details @#{file}"
#  #
#  #  expect { Whoopsy::Logger.new(args.shellsplit)}.not_to raise_error
#  #end
#  #
#  #it 'should fail if --details cannot be cracked' do
#  #
#  #  file = 'spec/data/bad.json'
#  #  args = "--event-type \"warning\" --service \"my script\" --environment \"development\" --message \"working ok today\" --event-group-identifier \"whats this\" --details @#{file}"
#  #
#  #  expect { Whoopsy::Logger.new(args.shellsplit)}.not_to raise_error
#  #end
#  #
#  #it 'should fail if --details file is empty' do
#  #
#  #  file = 'spec/data/empty.json'
#  #  args = "--event-type \"warning\" --service \"my script\" --environment \"development\" --message \"working ok today\" --event-group-identifier \"whats this\" --details @#{file}"
#  #
#  #  expect { Whoopsy::Logger.new(args.shellsplit)}.not_to raise_error
#  #end
#
#end