class CPF < BrazilianID
  def number_length; 11; end;

  def to_s
    "#{sequential.scan(/\d{3}/).join('.')}-#{check_digits}"
  end

  def inspect
    "#<CPF: #{to_s} #{valid? ? 'valid': 'not valid'} >"
  end

  def origin
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

  def from? uf
    origin.include? uf
  end
end

