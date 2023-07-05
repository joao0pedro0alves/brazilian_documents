# http://www.sintegra.gov.br/Cad_Estados/cad_GO.html
module BRDocuments
  class IE::GO < IE::Base

    set_verify_digits_weights first: %w(9 8 7 6 5 4 3 2)

    set_format_regexp %r{^(10)[.-]?(\d{3})[.-]?(\d{3})[.-]?(\d{1})}

    set_pretty_format_mask %(%s.%s.%s-%s)

    set_fixed_digits [[1, 2], 0]

    def self.valid_fixed_digits?(number)
      number = new(number).normalize
      current = number[0..1]

      fixed_digits = self.const_get('FIXED_INITIAL_NUMBERS')
      return fixed_digits[0].member?(current[0]) && fixed_digits[1] == current[1]
    end

  end
end