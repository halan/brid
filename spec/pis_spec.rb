require File.join(File.dirname(__FILE__), '..', 'lib', 'brazilian_id.rb')

describe PIS do
  it { PIS.new('170.33259.50-4').should be_valid }
  it { PIS.new('17033259504').to_s.should == '170.33259.50-4' }

end

