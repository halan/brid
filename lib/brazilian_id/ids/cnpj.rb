class CNPJ < BrazilianID
  def number_length; 14;  end;

  def to_s
    er = /^(.{2})(.{3})(.{3})(.{4})(.{2})/
    "#{@number.gsub(er, '\1.\2.\3/\4-\5')}"
  end

  def inspect
    "#<CNPJ: #{to_s} #{valid? ? 'valid': 'not valid'} >"
  end

  private
  def mod11 number
    Mod11.new(number, :base => 2..9).check_digit
  end
end


