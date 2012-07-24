class Mod10 < LuhnBase
  def initialize number, options = {}
    super number, :base => [2, 1], :mod => 10
  end

  def check_digit
    10 - (sum % 10) 
  end

  private
  def before_sum base, number
    super(base, number).to_s.chars.map(&:to_i).reduce(:+)
  end
end

