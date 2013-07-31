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