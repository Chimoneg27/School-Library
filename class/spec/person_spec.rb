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

  describe '#rental' do
    it 'returns an empty array for rental' do
      expect(@person.rental).to eql []
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person has parent permission' do
      expect(@person.can_use_services?).to eql true
    end

    it 'returns true if the person is over 18' do
      adult_person = Person.new(25)
      expect(adult_person.can_use_services?).to eql true
    end
  end

  describe '.all' do
    it 'returns all instances of Person' do
      persons = Person.all
      expect(persons).to include(@person)
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      expect(@person.correct_name).to eql 'maximilianus'
    end
  end
end
