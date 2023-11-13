class Execute
  def initialize(user_choice)
    @user_choice = user_choice
  end

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
end