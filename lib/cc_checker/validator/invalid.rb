module CcChecker
  class Validator
    class Invalid < Base
      def valid?
        false
      end
    end
  end
end
