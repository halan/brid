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
