module Brid
  class TituloEleitor < GenericID
    def number_length; 12; end;

    def initialize number
      @number = clear_number(number).rjust number_length, '0'

      raise ArgumentError.new "invalid number" if @number.length != number_length
    end


    def sequential 
      @sequential ||= begin
        @number[/^(.*)....$/, 1]
      end
    end

    def uf_digit
      @uf_digit ||= begin
        @number[/(..)..$/, 1]
      end
    end

    def to_s
      @number.scan(/\d{4}/).join ' '
    end

    def origin
      @origin ||= begin
        [ nil, :sp, :mg, :rj, :rs, :ba, :pr, :ce,
          :pe, :sc, :go, :ma, :pb, :pa, :es,
          :pi, :rn, :al, :mt, :ms, :df, :se,
          :am, :ro, :ac, :ap, :rr, :to, :exterior
        ][uf_digit.to_i]
      end
    end

    private
    def valid_number
      first_check_digit   = mod(sequential).check_digit.to_s
      second_check_digit  = mod(uf_digit+first_check_digit).check_digit.to_s

      sequential + uf_digit + first_check_digit + second_check_digit
    end
  end
end

TituloEleitoral = TituloEleitor = Brid::TituloEleitor unless defined? TituloEleitor and not defined? TituloEleitoral 
