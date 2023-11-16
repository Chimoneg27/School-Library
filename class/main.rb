require_relative 'app'
require_relative 'execute'
require 'json'
class Main
  def menu
    puts 'Please choose an option by entering a number: '
    load_data
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
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
      puts 'No books found.'
    else
      books = JSON.parse(books_data)
      puts 'Books:'
      books.each do |book|
        puts "Title: #{book['title']}, Author: #{book['author']}"
      end
    end
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
end

puts 'Welcome to the library!'
Main.new.menu
