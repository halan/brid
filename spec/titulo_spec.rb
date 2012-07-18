require File.join(File.dirname(__FILE__), '..', 'lib', 'brazilian_id.rb')

describe TituloEleitor do
  it { TituloEleitor.new('43568709/06').should be_valid }
  it { TituloEleitoral.new('43568709/06').should be_valid }
end
