require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'person'
require 'json'

class App
  def self.list_books
    Book.all.map { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def self.list_persons
    Person.all.map { |person| puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}" }
  end

  def self.create_classroom(label)
    Classroom.new(label)
  end

  def self.create_person
    print ' Do you want to create a student or a teacher? (s/t) '
    person_type = gets.chomp.to_s
    case person_type
    when 's'
      create_student(person_type)
    when 't'
      create_teacher(person_type)
    else
      puts 'Invalid input. Please enter a valid letter.'
      execute(3)
    end
    puts 'Person created successfully.'
  end

  def self.create_student(_person_type)
    age, name = fetch_user_input('Student')
    print 'Has parent permission? (Y/N): '
    parent_permission = gets.chomp.downcase == 'y'
    Student.new(age, name: name, parent_permission: parent_permission)
  end

  def self.create_teacher(_person_type)
    age, name = fetch_user_input('Teacher')
    print 'Specialization: '
    specialization = gets.chomp
    Teacher.new(specialization, age, name: name)
  end

  def self.fetch_user_input(person_type)
    print "Age for #{person_type}: "
    age = gets.chomp.to_i
    print "Name for #{person_type}: "
    name = gets.chomp.to_s
    [age, name]
  end

  def self.create_book
    title, author = fetch_book_info
    new_book = Book.new(title, author)
    puts 'Book created successfully.'
    new_book
  end

  def self.fetch_book_info
    print 'Title: '
    title = gets.chomp.to_s
    print 'Author: '
    author = gets.chomp.to_s
    [title, author]
  end

  def self.create_rental
    puts 'Select a book from the following list by number'
    Book.all.map.with_index do |book, index|
      puts " (#{index + 1}) Title: #{book.title}, Author: #{book.author}"
    end
    rental_book_index = gets.chomp.to_i
    rental_book = Book.all[rental_book_index - 1]

    puts 'Select a person from the folowing list by number(not id)'
    Person.all.map.with_index do |person, index|
      puts "(#{index + 1}), Name: #{person.name}, Age: #{person.age}"
    end
    rental_person_index = gets.chomp.to_i
    rental_person = Person.all[rental_person_index - 1]

    print 'Date: '
    date = gets.chomp
    Rental.new(date, rental_person, rental_book)
    puts 'Rental created successfully'
  end

  def self.list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    person = Person.all.select { |x| x.id == id }[0]

    if person
      puts 'Rentals:'
      person.rental.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title}" }
    else
      puts 'Person with the given ID does not exist '
    end
  end

  def self.save_data
    books = Book.all.map { |book| { title: book.title, author: book.author } }
    people = Person.all.map do |person|
      { id: person.id, age: person.age, name: person.name, rental: [] }
    end

    rentals = Rental.all.map do |rental|
      { date: rental.date, person: { id: rental.person.id, age: rental.person.age, name: rental.person.name },
        book: { author: rental.book.author, title: rental.book.title } }
    end

    books_json = books.to_json
    people_json = people.to_json
    rentals_json = rentals.to_json

    File.write('rentals.json', rentals_json)
    File.write('books.json', books_json)
    File.write('people.json', people_json)
    
    puts 'Data saved successfully.'
  end
end
