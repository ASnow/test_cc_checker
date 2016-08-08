require 'spec_helper'

describe CcChecker::Validator::Luhn do

  describe '#valid?' do
    subject{ described_class.new(context).valid? }

    shared_examples "luhn algo" do |card_number, result|
      let(:context) { double(card_number: card_number) }

      it "return #{result.inspect} for #{card_number.inspect}" do
        expect(subject).to eq(result)
      end
    end

    it_behaves_like "luhn algo", '', true
    it_behaves_like "luhn algo", '42', true
    it_behaves_like "luhn algo", '00', true
    it_behaves_like "luhn algo", '0505', true
    it_behaves_like "luhn algo", '1', false
    it_behaves_like "luhn algo", '0515', false
  end
end
