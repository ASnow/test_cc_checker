module CcChecker
  class Validator
    CARD_TYPES = [CcChecker::Validator::Amex]    
    attr_accessor :card_number

    def initialize card_number
      @card_number = card_number
    end

    def valid?
      return false unless @card_number.is_a? String

      CARD_TYPES.any? do |card_type|
        card_type.new(self).valid?
      end
    end
  end
end
