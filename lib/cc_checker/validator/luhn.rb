module CcChecker
  class Validator
    class Luhn < Base
      def valid?
        check_number = card_number.reverse.each_char.each_slice(2).inject(0) do |sum, digits|
          sum + digits[0].to_i + digits[1].to_i * 2
        end

        check_number % 10 == 0
      end
    end
  end
end
