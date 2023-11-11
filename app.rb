require './person'
require './student'
require './classroom'
require './rental'
require './book'
require './teacher'

class App
  def initialize
    @books = []
    @persons = []
  end

  def listAllBooks
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book creation successfully'
  end

  def createPerson(person_id)
    if person_id == 1
      create_student
    elsif person_id == 2
      create_teacher
    else
      puts 'Enter a valid Input'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Parent permission? [Y/N]: '
    permission = gets.chomp
    permission_values = %w[n N]
    newPerson = Student.new(age, name, permission_values.include?(permission))
    @persons.push(newPerson)
  end 

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    newPerson = Teacher.new(name,specialization, age)
    @persons.push(newPerson)
  end

  def listPersons
    @persons.each do |person|
      person_type = person.is_a?(Student) ? 'Student' : 'Teacher'
      puts "[#{person_type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts 'Select person from the following list by number'
    @persons.each_with_index do |person, index|
      person_type = person.instance_of?(Student) ? 'Student' : 'Teacher'
      puts "#{index})[#{person_type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    Rental.new(@books[book_index], @persons[person_index], date)
    puts 'Rental created successfully'
  end  

  def get_rental(id)
    person = @persons.find { |per| per.id == id }
    if person
      puts 'Rentals:'
      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    else
      puts "Person with ID #{id} not found."
    end
  end
end
