class PIS < BrazilianID
  def number_length; 11; end

  def check_digits
    @check_digits ||= begin
      @number[/.$/]
    end
  end

  def sequential
    @sequential ||= begin
      @number[/^(.*).$/, 1]
    end
  end

  def to_s
    er = /^(.{3})(.{5})(.{2})(.{1})/
    "#{@number.gsub(er, '\1.\2.\3-\4')}"
  end

  private
  def mod11 number
    Mod11.new(number, :base => 2..9).check_digit
  end

  def valid_number
    sequential + mod11(sequential).to_s
  end
end
