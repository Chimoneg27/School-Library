require_relative 'app'
require_relative 'execute'
require 'json'

# rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
class Main
  def menu
    puts 'Please choose an option by entering a number: '
    load_data
    puts '1 - List books'
    puts '2 - List people'
    puts '3 - Create person'
    puts '4 - Create book'
    puts '5 - Create rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    user_choice = gets.chomp.to_i
    puts user_choice
    Execute.new(user_choice).execute
  end
end

def load_data
  if File.exist?('books.json')
    books_data = File.read('books.json')
    if books_data.empty?
      puts 'No books found'
    else
      books = JSON.parse(books_data)
      puts 'Books:'
      books.each do |book|
        puts "Title: #{book['title']}, Author: #{book['author']}"
      end
    end
  else
    puts 'No books file found'
  end

  if File.exist?('people.json')
    people_data = File.read('people.json')
    if people_data.empty?
      puts 'No people found'
    else
      people = JSON.parse(people_data)
      puts 'People:'
      people.each do |person|
        puts "ID: #{person['id']} Age: #{person['age']} Name: #{person['name']} Rental: #{person['rental']}"
      end
    end
  else
    puts 'No people file found'
  end

  if File.exist?('rentals.json')
    rental_data = File.read('rentals.json')
    if rental_data.empty?
      puts 'No rentals found'
    else
      rentals = JSON.parse(rental_data)
      puts 'Rentals:'
      rentals.each do |rental|
        date = rental['date']
        person = rental['person']
        book = rental['book']

        puts "Date: #{date}"
        puts "Person ID: #{person['id']}"
        puts "Person Age: #{person['age']}"
        puts "Person Name: #{person['name']}"
        puts "Book Author: #{book['author']}"
        puts "Book Title: #{book['title']}"
        puts '-----------------'
      end
    end
  else
    puts 'No rentals file found'
  end
end
# rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
# data
puts 'Welcome to the library!'
Main.new.menu
