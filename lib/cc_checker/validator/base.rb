module CcChecker
  class Validator
    class Base
      extend Forwardable
      def_delegators :@context, :card_number, :add

      def initialize context
        @context = context
      end

      def valid?
        raise "should be implemented in child class"
      end
    end
  end
end
