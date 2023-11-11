# /usr/bin/env ruby
require './app'
app = App.new

def main(app)
  all_options_show
  number = gets.chomp.to_i
  execute_option(app, number)
end

def all_options_show
  puts
  puts 'Get started by entering a number :'
  puts '1 - List Books'
  puts '2 - List People'
  puts '3 - Create Person'
  puts '4 - Create Book'
  puts '5 - Create Rental'
  puts '6 - List all rentals with Person_id'
  puts '7 - EXIT THE TERMINAL APP'
end

def execute_option(app, number)
  option_methods = {
    1 => :list_all_books,
    2 => :list_persons,
    3 => :create_person,
    4 => :create_book_option,
    5 => :create_rental,
    6 => :get_rental_option,
    7 => :exit_app
  }

  if option_methods.key?(number)
    send(option_methods[number], app)
  else
    puts 'Enter valid number'
    main(app)
  end
end

def exit_app(*)
  puts 'Thank you for using Terminal App, Hope you liked it !'
end

def create_person(app)
  print 'Do you want to create Student(1) or Teacher (2)? [Your Response]: '
  person_individual_id = gets.chomp.to_i
  app.create_person(person_individual_id)
  main(app)
end

def create_book_option(app)
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  app.create_book(title, author)
  main(app)
end

def get_rental_option(app)
  print 'ID of person: '
  id = gets.chomp.to_i
  app.get_rental(id)
  main(app)
end

def list_all_books(app)
  app.list_all_books
  main(app)
end

def list_persons(app)
  app.list_persons
  main(app)
end

def create_rental(app)
  app.create_rental
  main(app)
end

puts 'Welcome to School Library Terminal App!'
main(app)
