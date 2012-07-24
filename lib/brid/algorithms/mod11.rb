class Mod11 < LuhnBase
  def initialize number, options = {}
    options[:mod] = 11
    super number, {:base => 2..11}.merge(options)
  end

  def check_digit
    ((10 * sum) % @mod) % 10
  end
end

class String
  def mod11 digits, options = {}
    (Mod11.new(self, options) * digits).to_s
  end
end

