require File.join(File.dirname(__FILE__), '..', 'lib', 'brazilian_id.rb')

describe GenericID do
  it { GenericID.new('10365-9').should be_valid }
end
