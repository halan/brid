class Mod
  def initialize number, options = {}
    @mod, @base = 0, 0..100
    @number     = number.to_s.scan(/\d/).join
    @base       = options[:base]  if options.has_key? :base
    @mod        = options[:mod]   if options.has_key? :mod
  end

  def check_digit
    sum / @mod
  end

  def * digits
    digits.times.reduce(self) do |number, digit|
      number += self.class.new(number, :base => @base, :mode => @mod).check_digit
    end
  end

  def + digit
    self.class.new(@number += digit.to_s.scan(/\d/).join, :base => @base, :mode => @mod)
  end

  def to_s
    @number.to_s
  end

  def == other
    self.to_s == other.to_s
  end

  protected
  def bases
    multipliers = ([*@base] * (@number.length/@base.count+1))[0..(@number.length-1)].reverse
  end

  def numbers_list
    @number.chars.map &:to_i
  end

  def sum
    bases.zip(numbers_list).reduce(0) {|total, n| total += before_sum(*n) }
  end

  def before_sum base, number
    base * number
  end
end

