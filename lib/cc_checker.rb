require 'forwardable'
require 'cc_checker/version'
require 'cc_checker/validator/base'
require 'cc_checker/validator/luhn'
require 'cc_checker/card_type'
require 'cc_checker/validator'

module CcChecker
  def self.run(card_number)
    Validator.new(card_number)
  end
end
