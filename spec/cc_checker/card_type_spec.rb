require 'spec_helper'

describe CcChecker::CardType do
  let(:item) { described_class.new(card_number) }
  shared_examples "card type" do |type, valid|
    let(:item) { type }

    describe "#{type.name}.====" do
      it "return true for #{valid.inspect}" do
        expect(item === valid).to eq(0)
      end
    end
  end

  context 'UNKNOWN' do
    it_behaves_like "card type", described_class::UNKNOWN, 'any', false
  end
  context 'AMEX' do
    it_behaves_like "card type", described_class::AMEX, '340010001000107'
    it_behaves_like "card type", described_class::AMEX, '370010001000104'
  end
  context 'DISCOVER' do
    it_behaves_like "card type", described_class::DISCOVER, '6011100010001005'
  end
  context 'MASTER_CARD' do
    it_behaves_like "card type", described_class::MASTER_CARD, '5100010001000100'
    it_behaves_like "card type", described_class::MASTER_CARD, '5200010001000100'
    it_behaves_like "card type", described_class::MASTER_CARD, '5300010001000100'
    it_behaves_like "card type", described_class::MASTER_CARD, '5400010001000100'
    it_behaves_like "card type", described_class::MASTER_CARD, '5500010001000100'
  end
  context 'VISA' do
    it_behaves_like "card type", described_class::VISA, '4100010001000100'
    it_behaves_like "card type", described_class::VISA, '4100010001000'
  end
end
