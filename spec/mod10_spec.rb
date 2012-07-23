require File.join(File.dirname(__FILE__), '..', 'lib', 'brid.rb')

describe Mod10 do
  it { Mod10.new('01230067896').check_digit.should    ==  3 }
  it { Mod10.new('3011119876333').check_digit.should  ==  5 }
  it { Mod10.new('2799811').check_digit.should        ==  1 }
end
