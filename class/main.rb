require_relative 'app'
# require_relative 'execute'

# Delete line 5 to 17
def menu
  puts 'Please choose an option by entering a number: '
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
  user_choice = gets.chomp.to_i
  puts user_choice
  execute(user_choice)
end

# The new class
# class Main 
#   def menu
#     puts 'Please choose an option by entering a number: '
#     puts '1 - List all books'
#     puts '2 - List all people'
#     puts '3 - Create a person'
#     puts '4 - Create a book'
#     puts '5 - Create a rental'
#     puts '6 - List all rentals for a given person id'
#     puts '7 - Exit'
#     user_choice = gets.chomp.to_i
#     puts user_choice
#     Execute.new(user_choice).execute
#   end
# end

# rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity
# delete line 20 to 47
def execute(user_choice)
  case user_choice

  when 1
    puts App.list_books
    menu
  when 2
    puts App.list_persons
    menu
  when 3
    App.create_person
    menu
  when 4
    App.create_book
    menu
  when 5
    App.create_rental
    menu
  when 6
    App.list_rentals
    menu
  when 7
    abort 'Thank you for using the library.'
  else
    puts 'Invalid input. Please enter a valid number.'
    menu
  end
end

# rubocop:enable Metrics/MethodLength, Metrics/CyclomaticComplexity
puts 'Welcome to the library!'
menu # replace this line with Main.new.menu
