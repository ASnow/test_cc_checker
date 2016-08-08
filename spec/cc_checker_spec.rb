require 'spec_helper'

describe CcChecker do
  it 'has a version number' do
    expect(CcChecker::VERSION).not_to be nil
  end

  describe '.run' do
    it 'expects argument' do
      expect{ CcChecker.run }.to raise_error
    end

    it 'get credit card number as argument' do
      expect(CcChecker.run(:arg)).not_to be nil
    end

    it 'return validator value' do
      expect_any_instance_of(CcChecker::Validator).to receive(:valid?).and_return(:return_value)
      expect(CcChecker.run(:arg)).to be :return_value
    end
  end
end
