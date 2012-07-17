class BrazilianID
  def number_length; 0; end;
  def check_digits_length; 2; end;

  def initialize number
    @number = clear_number(number)[0..number_length]
  end

  def check_digits
    @number[/..$/]
  end

  def sequential
    @number[/^(.*)..$/, 1]
  end

  def valid?
    @number == valid_number and not invalid_sequential?
  end

  def invalid_sequential?
    sequential.chars.to_a.uniq.count.eql? 1
  end

  def to_s
    "#{sequential.scan(/\d{3}/).join('.')}-#{check_digits}"
  end

  protected
  def mod11 number
    Mod11.new(number).check_digit
  end

  def valid_number
    (1..check_digits_length).reduce(sequential) do |number, digit|
      number += mod11(number).to_s
    end
  end

  def clear_number number
    number.to_s.scan(/\d/).join
  end
end


