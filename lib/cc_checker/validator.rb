module CcChecker
  class Validator
    CARD_TYPES = []    

    def initialize card_number
      @card_number = card_number
    end

    def valid?
      return false unless @card_number.is_a? String
      CARD_TYPES.any?{}
    end
  end
end
