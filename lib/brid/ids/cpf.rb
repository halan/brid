module Brid
  class CPF < GenericID
    def number_length; 11; end
    def check_digits_length; 2; end;

    def to_s
      "#{sequential.scan(/\d{3}/).join('.')}-#{check_digits}"
    end

    def inspect
      "#<CPF: #{to_s} #{valid? ? 'valid': 'not valid'} >"
    end

    def origin
      @origin ||= begin
        [
          [:rs],
          [:df, :go, :ms, :mt, :to],
          [:ac, :am, :ap, :pa, :ro, :rr],
          [:ce, :ma, :pi],
          [:al, :pb, :pe, :rn],
          [:ba, :se],
          [:mg],
          [:es, :rj],
          [:sp],
          [:pr, :sc]
        ][sequential[-1,1].to_i]
      end
    end

    def from? uf
      origin.include? uf
    end
  end
end

CPF = Brid::CPF if not defined? CPF and not defined? Cpf
