require 'spec_helper'

describe CcChecker do
  it 'has a version number' do
    expect(CcChecker::VERSION).not_to be nil
  end

  describe '.run' do
    it 'get credit card number as argument' do
      expect(CcChecker.run()).not_to be nil
    end
    it 'return boolean' do
      expect(CcChecker.run()).not_to be nil
    end
  end
end
