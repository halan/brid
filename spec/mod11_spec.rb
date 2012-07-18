require File.join(File.dirname(__FILE__), '..', 'lib', 'brazilian_id.rb')

describe Mod11 do
  it { Mod11.new('009147274').check_digit.should ==  1 }
  it { Mod11.new('0091472741').check_digit.should == 9 }

  it { (Mod11.new('009147274') * 2).to_s.should == '00914727419' }
end
