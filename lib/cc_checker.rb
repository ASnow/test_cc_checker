require "cc_checker/version"
require "cc_checker/validator/luhn"
require "cc_checker/validator/amex"
require "cc_checker/validator"

module CcChecker
  def self.run card_number
    Validator.new(card_number).valid?
  end
end
