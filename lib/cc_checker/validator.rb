module CcChecker
  class Validator
    DEFULT_CARD_TYPE = CcChecker::CardType.new(:Unknown, /.?/, CcChecker::Validator::Luhn)
    CARD_TYPES = [
      CcChecker::CardType.new(:AMEX, /\A3(4|7)\d{13}\z/, CcChecker::Validator::Luhn),
      CcChecker::CardType.new(:Discover, /\A6011\d{12}\z/, CcChecker::Validator::Luhn),
      CcChecker::CardType.new(:MasterCard, /\A5[1-5]\d{14}\z/, CcChecker::Validator::Luhn),
      CcChecker::CardType.new(:Visa, /\A4\d{12,15}\z/, CcChecker::Validator::Luhn)
    ]
    attr_accessor :card_number

    def initialize card_number
      @errors = []
      @card_number = card_number
    end

    def add error
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
