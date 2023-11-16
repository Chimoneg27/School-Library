require_relative 'spec_helper'

describe Person do
  before :each do
    @person = Person.new(22, 'maximilianus')
  end

  describe '#new' do
    it 'returns an instance of Person' do
      expect(@person).to be_an_instance_of Person
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      expect(@person.name).to eql 'maximilianus'
    end
  end

  describe '#age' do
    it 'returns the correct age' do
      expect(@person.age).to eql 22
    end
  end
end
