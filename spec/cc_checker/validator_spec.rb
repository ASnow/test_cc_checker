require 'spec_helper'

describe CcChecker::Validator do
  let(:item) { described_class.new(card_number) }

  describe '#valid?' do

    subject{ item.valid? }

    context 'not string' do
      shared_examples "wrong" do |parameter|
        let(:card_number) { parameter }
        it "return false for #{parameter.inspect}" do
          expect(subject).to eq(false)
        end
        it "don't run type search for #{parameter.inspect}" do
          expect(item).not_to receive(:card_type)
          subject
        end
      end

      [nil, 1, [], {}, false, true, :symbol].each do |arg|
        it_behaves_like "wrong", arg
      end
    end

    context 'string' do
      let(:card_number){ '' }

      context 'return card type check as result' do
        it "false" do
          expect(item).to receive(:card_type).and_return(double(:result, :valid? => false))
          expect(subject).to eq(false)
        end

        it "true" do
          expect(item).to receive(:card_type).and_return(double(:result, :valid? => true))
          expect(subject).to eq(true)
        end
      end
    end
  end

  describe '#card_type' do
    before :each do
      stub_const('CcChecker::Validator::CARD_TYPES', [other_card_type, card_type])
      stub_const('CcChecker::Validator::DEFULT_CARD_TYPE', :default)
    end

    let(:card_number) { :any }
    let(:card_type){ double(:card_type, :=== => false) } 
    let(:other_card_type){ double(:other_card_type, :=== => false) } 

    subject{ item.send :card_type }

    context 'for wrong card number' do
      it 'return default' do
        expect(card_type).to receive(:===).and_return(false)
        expect(subject).to eq(:default)
      end
    end


    context 'for right card number' do
      it 'return card type' do
        expect(card_type).to receive(:===).and_return(true)
        expect(subject).to eq(card_type)
      end
    end
  end
end
