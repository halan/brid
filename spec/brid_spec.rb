require File.join(File.dirname(__FILE__), '..', 'lib', 'brid.rb')

describe Brid do
  it { Brid.detect('009.147.274-19').should be_kind_of(CPF) }
  it { Brid.detect('18781203000128').should be_kind_of(CNPJ) }
  it { Brid.detect('009.147.274-19', nil).should be_nil }

end
