require File.join(File.dirname(__FILE__), '..', 'lib', 'brid.rb')

describe Mod10 do
  it { CredCard.new('411119876333502').should  be_valid }
  it { CredCard.new('211119876333501').should_not  be_valid }

end
