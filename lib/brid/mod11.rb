class Mod11 < Mod
  def initialize number, options = {}
    options[:mod] = 11
    super number, {:base => 2..11}.merge(options)
  end

  def check_digit
    ((10 * sum) % @mod) % 10
  end
end

