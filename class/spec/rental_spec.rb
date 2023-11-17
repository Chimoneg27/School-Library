require_relative 'spec_helper'
require 'date'

describe Rental do
  let(:person) { Person.new(25, 'John Doe') }
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:rental_date) { Date.new(2023, 1, 1) }

  context 'Initialization' do
    it 'should be an instance of Rental' do
      rental = Rental.new(rental_date, person, book)
      expect(rental).to be_an_instance_of(Rental)
    end

    it 'should have a date, person, and book' do
      rental = Rental.new(rental_date, person, book)
      expect(rental.date).to eq(rental_date)
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
    end

    it 'should add the rental to the person and book' do
      rental = Rental.new(rental_date, person, book)
      expect(person.rental).to include(rental)
      expect(book.rental).to include(rental)
    end
  end

  context 'Class Methods' do
    it 'should return all rentals' do
      rental1 = Rental.new(rental_date, person, book)
      rental2 = Rental.new(rental_date, person, book)

      all_rentals = Rental.all

      expect(all_rentals).to include(rental1, rental2)
    end
  end
end
