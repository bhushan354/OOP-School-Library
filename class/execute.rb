# rubocop:disable Metrics
class Execute
  def initialize(user_choice)
    @user_choice = user_choice
  end

  def execute
    case @user_choice

    when 1
      puts App.list_books
      Main.new.menu
    when 2
      puts App.list_persons
      Main.new.menu
    when 3
      App.create_person
      Main.new.menu
    when 4
      App.create_book
      Main.new.menu
    when 5
      App.create_rental
      Main.new.menu
    when 6
      App.list_rentals
      Main.new.menu
    when 7
      abort 'Thank you for using the library.'
    else
      puts 'Invalid input. Please enter a valid number.'
      Main.new.menu
    end
  end
end
# rubocop:enable Metrics
