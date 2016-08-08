module CcChecker
  class CardType
    attr_accessor :name

    def initialize(name, card_mask, *validators)
      @name = name
      @card_mask = card_mask
      @validators = validators
    end

    def ===(string)
      string =~ @card_mask
    end

    def valid?(context)
      @validators.all? { |validator| validator.new(context).valid? }
    end
  end
end

module CcChecker
  class CardType
    UNKNOWN = CcChecker::CardType.new(:Unknown, /.?/, CcChecker::Validator::Luhn)
    AMEX = CcChecker::CardType.new(:AMEX, /\A3(4|7)\d{13}\z/, CcChecker::Validator::Luhn)
    DISCOVER = CcChecker::CardType.new(:Discover, /\A6011\d{12}\z/, CcChecker::Validator::Luhn)
    MASTER_CARD = CcChecker::CardType.new(:MasterCard, /\A5[1-5]\d{14}\z/, CcChecker::Validator::Luhn)
    VISA = CcChecker::CardType.new(:Visa, /\A4\d{12,15}\z/, CcChecker::Validator::Luhn)
  end
end
