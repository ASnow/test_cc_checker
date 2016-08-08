require 'spec_helper'

describe CcChecker::Validator do
  describe '#valid?' do
    subject{ described_class.new(card_number).valid? }

    context 'not string' do
      shared_examples "wrong" do |parameter|
        let(:card_number) { parameter }
        it "return false for #{parameter.inspect}" do
          expect(subject).to eq(false)
        end
      end

      [nil, 1, [], {}, false, true, :symbol].each do |arg|
        it_behaves_like "wrong", arg
      end
    end

    context 'string' do
      let(:card_number){ '' }
    end
  end
end
