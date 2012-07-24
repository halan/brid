module Brid
  class CNPJ < GenericID
    def number_length; 14; end
    def check_digits_length; 2; end;

    def to_s
      er = /^(.{2})(.{3})(.{3})(.{4})(.{2})/
      "#{@number.gsub(er, '\1.\2.\3/\4-\5')}"
    end

    def inspect
      "#<CNPJ: #{to_s} #{valid? ? 'valid': 'not valid'} >"
    end

    private
    def valid_number
      sequential.mod11(check_digits_length, :base => 2..9)
    end
  end
end

CNPJ = Brid::CNPJ if not defined? CNPJ and not defined? Cnpj
