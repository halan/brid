require File.join(File.dirname(__FILE__), '..', 'lib', 'brid.rb')

describe Mod10 do
  it { CredCard.new('30111198763335').should  be_valid }
  it { CredCard.new('10111198763335').should_not  be_valid }

end
