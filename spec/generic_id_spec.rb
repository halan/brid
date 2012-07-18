require File.join(File.dirname(__FILE__), '..', 'lib', 'brid.rb')

describe GenericID do
  it { GenericID.new('10365-9').should be_valid }
end
