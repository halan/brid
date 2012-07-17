class Mod11
  def initialize number, options = {}
    options = {:base => 2..11, :mod => 11}.merge options

    @number = number.to_s.scan(/\d/).join
    @base   = options[:base]
    @mod    = options[:mod]
  end

  def check_digit
    if block_given?
      yield sum, @mod
    else
      ((10 * sum) % @mod) % 10
    end
  end

  private
  def bases
    multipliers = ([*@base] * (@number.length/@base.count+1))[0..(@number.length-1)].reverse
  end

  def numbers_list
    @number.chars.map &:to_i
  end

  def sum
    bases.zip(numbers_list).reduce(0) {|total, n| total += n[0] * n[1]}
  end
end

