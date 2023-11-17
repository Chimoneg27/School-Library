require_relative 'spec_helper'

describe CapitalizeDecorator do
  before :each do
    @nameable = double('nameable')
    allow(@nameable).to receive(:correct_name).and_return('john doe')
    @decorator = CapitalizeDecorator.new(@nameable)
  end

  it 'correctly capitalizes the name passed to it' do
    expect(@decorator.correct_name).to eql 'John doe'
  end
end
