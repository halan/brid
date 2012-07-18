class BrazilianID
  def number_length; 0; end;
  def check_digits_length; 2; end;

  def initialize number
    @number = clear_number(number)

    raise ArgumentError.new "invalid number" if @number.length != number_length
  end

  def check_digits
    @check_digits ||= begin
      @number[/..$/]
    end
  end

  def sequential
    @sequential ||= begin
      @number[/^(.*)..$/, 1]
    end
  end

  def valid?
    @valid ||= begin
      @number == valid_number and not invalid_sequential?
    end
  end

  def invalid_sequential?
    @invalid_sequential ||=begin
      sequential.chars.to_a.uniq.count.eql? 1
    end
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


