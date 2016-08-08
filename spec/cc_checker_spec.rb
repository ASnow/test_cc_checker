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

    it 'return validator' do
      expect(CcChecker.run(:arg)).to be_a CcChecker::Validator
    end
  end
end
