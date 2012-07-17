require File.join(File.dirname(__FILE__), '..', 'lib', 'brazilian_id.rb')

describe CNPJ do
  it { CNPJ.new('18781203/0001-28').should be_valid }
end
