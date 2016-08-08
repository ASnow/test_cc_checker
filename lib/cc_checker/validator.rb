module CcChecker
  class Validator
    DEFULT_CARD_TYPE = CcChecker::CardType::UNKNOWN
    CARD_TYPES = [
      CcChecker::CardType::AMEX,
      CcChecker::CardType::DISCOVER,
      CcChecker::CardType::MASTER_CARD,
      CcChecker::CardType::VISA
    ].freeze
    attr_accessor :card_number

    def initialize(card_number)
      @errors = []
      @card_number = card_number
    end

    def add(error)
      @errors << error
    end

    def valid?
      return false unless @card_number.is_a? String

      card_type.valid? self
    end

    def card_type
      @card_type ||= CARD_TYPES.find do |type|
        type === @card_number
      end || DEFULT_CARD_TYPE
    end
  end
end
