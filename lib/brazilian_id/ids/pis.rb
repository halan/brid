module BrID
  class PIS < GenericID
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
      Mod11.new(number, :base => 2..9)
    end

    def valid_number
      mod11(sequential) * 1
    end
  end
end

PIS = BrID::PIS if not defined? PIS and not defined? Pis
