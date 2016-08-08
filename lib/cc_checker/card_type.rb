module CcChecker
  class CardType
    attr_accessor :name

    def initialize name, card_mask, *validators
      @name = name
      @card_mask = card_mask
      @validators = validators
    end

    def === string
      string =~ @card_mask
    end

    def valid? context
      @validators.all?{ |validator| validator.new(context).valid? }
    end
  end
end
