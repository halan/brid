module Brid
  class CredCard < GenericID
    def initialize number
      @number = clear_number(number)

      raise ArgumentError.new "invalid number" unless (14..19).include? @number.length
    end

    def sequential 
      @sequential ||= begin
        @number[/^(.*).$/, 1]
      end
    end

    def association
      return :dinners  if @number.length == 14 and @number =~ /^3(0[0-5]|[68])/   # 300xxx-305xxx, 36xxxx, 38xxxx
      return :amex     if @number.length == 15 and @number =~ /^3[47]/            # 34xxxx, 37xxxx
      return :visa     if [13,16].include?(@number.length) and @number =~ /^4/    # 4xxxxx
      return :master   if @number.length == 16 and @number =~ /^5[1-5]/           # 51xxxx-55xxxx
      return :discover if @number.length == 16 and @number =~ /^6011/             # 6011xx
      return false
    end

    def invalid_sequential?
      @invalid_sequential ||=begin
        association != false
      end
    end

    private
    def mod number
      Mod10.new number
    end

    def valid_number
      sequential + mod(sequential).check_digit.to_s
    end
  end
end

CredCard = Brid::CredCard if not defined? CredCard
