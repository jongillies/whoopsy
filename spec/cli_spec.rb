require 'spec_helper'
require 'whoopsy'
require 'shellwords'
require 'yaml'

describe 'Different Command Line Options' do
  it 'should fail with no options' do
    expect { Whoopsy::GemName.new({}) }.to raise_error
  end
  #
  it 'should succeed with minimum arguments' do
    args = 'my-argument'
    expect { Whoopsy::GemName.new(args.shellsplit, 'banner', 'version') }.not_to raise_error
  end
end
