require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'person'

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
    display_books_for_rental
    rental_book_index = gets.chomp.to_i
    rental_person = select_person(rental_book_index)

    date = fetch_rental_date
    Rental.new(date, rental_person, rental_book_index)
    puts 'Rental created successfully.'
  end

  def self.display_books_for_rental
    puts 'Please select a book from the following list by number:'
    Book.all.each_with_index do |book, index|
      puts "(#{index + 1}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def self.select_person(rental_book_index)
    Person.all[rental_book_index - 1]
  end

  def self.fetch_rental_date
    print 'Date: '
    gets.chomp
  end

  def self.list_rentals
    id = fetch_person_id
    display_person_rentals(id)
  end

  def self.fetch_person_id
    print 'ID of person: '
    gets.chomp.to_i
  end

  def self.display_person_rentals(id)
    person = find_person_by_id(id)
    if person
      display_rentals(person)
    else
      puts 'Person not found.'
    end
  end

  def self.find_person_by_id(id)
    Person.all.find { |person| person.id == id }
  end

  def self.display_rentals(person)
    puts 'Rentals:'
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title}"
    end
  end
end
