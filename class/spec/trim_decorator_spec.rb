require_relative 'spec_helper'

describe TrimDecorator do
  before :each do
    @nameable = double('nameable')
    @decorator = TrimDecorator.new(@nameable)
  end

  describe '#correct_name' do
    it 'returns the first 9 characters of the correct_name of the nameable object' do
      allow(@nameable).to receive(:correct_name).and_return('This is a long name')
      expect(@decorator.correct_name).to eql('This is a ')
    end

    it 'returns an empty string when the correct_name of the nameable object is empty' do
      allow(@nameable).to receive(:correct_name).and_return('')
      expect(@decorator.correct_name).to eql('')
    end
  end
end