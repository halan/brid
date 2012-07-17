require File.join(File.dirname(__FILE__), '..', 'lib', 'brazilian_id.rb')

describe Mod11 do
  it { Mod11.new('017505684').check_digit.should ==  6 }
  it { Mod11.new('0175056846').check_digit.should == 2 }
end
