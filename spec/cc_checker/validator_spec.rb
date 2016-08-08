require 'spec_helper'

describe CcChecker::Validator do
  describe '#valid?' do
    before :each do
      stub_const('CcChecker::Validator::CARD_TYPES', [card_type_validator_factory])
    end

    let(:card_type_validator){ double(:card_type_validator, valid?: false) } 
    let(:card_type_validator_factory){ double(:card_type_validator_factory, new: card_type_validator) } 

    subject{ described_class.new(card_number).valid? }

    context 'not string' do
      shared_examples "wrong" do |parameter|
        let(:card_number) { parameter }
        it "return false for #{parameter.inspect}" do
          expect(subject).to eq(false)
        end
        it "don't run validators factory for #{parameter.inspect}" do
          expect(card_type_validator_factory).not_to receive(:new)
          subject
        end
      end

      [nil, 1, [], {}, false, true, :symbol].each do |arg|
        it_behaves_like "wrong", arg
      end
    end

    context 'string' do
      let(:card_number){ '' }
      it "run validators factory" do
        expect(card_type_validator_factory).to receive(:new)
        subject
      end

      it "run validators check" do
        expect(card_type_validator).to receive(:valid?)
        subject
      end

      context 'return validators check as result' do
        it "false" do
          expect(card_type_validator).to receive(:valid?).and_return(false)
          expect(subject).to eq(false)
        end

        it "true" do
          expect(card_type_validator).to receive(:valid?).and_return(true)
          expect(subject).to eq(true)
        end
      end
    end
  end
end
