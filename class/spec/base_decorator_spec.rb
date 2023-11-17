require_relative 'spec_helper'

describe Decorator do
  before :each do
    @nameable = double('Nameable')
    @decorator = Decorator.new(@nameable)
  end

  describe '#correct_name' do
    it 'calls correct_name on the nameable object' do
      expect(@nameable).to receive(:correct_name)
      @decorator.correct_name
    end
  end
end