module CcChecker
  class Validator
    class Base
      def initialize context
        @context = context
      end

      def card_number
        @context.card_number
      end

      def valid?
        raise "should be implemented in child class"
      end
    end
  end
end
