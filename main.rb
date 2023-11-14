# /usr/bin/env ruby
require './app'
require './execute'
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
