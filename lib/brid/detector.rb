module Brid
  @@detect_between = {
    :cpf            => Brid::CPF,
    :cnpj           => Brid::CNPJ,
    :titulo_eleitor => Brid::TituloEleitor,
    :pis            => Brid::PIS
  } 

  def self.detect number, between = [:cpf, :cnpj, :titulo_eleitor, :pis]
    id = [*between].each do |class_symbol|
      break unless class_symbol

      class_constant  = @@detect_between[class_symbol]
      begin
        _number         = class_constant.new number
        break _number  if _number and _number.valid?
      rescue ArgumentError
      end
    end

    id if id.kind_of? GenericID
  end
end
