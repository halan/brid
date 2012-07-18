require File.join(File.dirname(__FILE__), '..', 'lib', 'brid.rb')

describe CPF do
  it { CPF.new('009.147.274-19').should be_valid }
  it { CPF.new('009.147.074-19').should_not be_valid }


  it { CPF.new('009.147.274-10').should_not be_valid }
  it { CPF.new('000.000.000-00').should_not be_valid }
  it { CPF.new('111.111.111-11').should_not be_valid }

  it { lambda { CPF.new('foobar') }.should raise_error(ArgumentError)}
end
