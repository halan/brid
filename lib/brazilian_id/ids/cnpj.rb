class CNPJ < BrazilianID
  def number_length; 14;  end;

  def to_s
    "#{sequential.scan(/\d{3}/).join('.')}-#{check_digits}"
  end

  def inspect
    "#<CNPJ: #{to_s} #{valid? ? 'valid': 'not valid'} >"
  end

  private
  def mod11 number
    Mod11.new(number, :base => 2..9).check_digit
  end
end


