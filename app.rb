require './person'
require './student'
require './classroom'
require './rental'
require './book'
require './teacher'

class App
    def initialize()
        @books = []
        @persons = []
    end

    def create_book(title, author)
        book = Book.new(title, author)
        @books.push(book)
        p 'Book created successfully'
    end

    def create_person(person_id)
        if person_id == 1
            create_student
        elseif person_id == 2
            create_teacher
        else
            puts 'Enter valid number '
            call(5)
        end
        puts 'Creation success'
    end

    def create_student
        print 'age: '
        # gets.chomp  is used to get input
        # to_i is function to convert to integer
        age = gets.chomp.to_i
        print 'name: '
        name = gets.chomp
        print 'parent permission ? [Y]yes [N]no: '
        has_permission = gets.chomp
        permission_type = %w[n N]
        personIndividual = Student.new(age, name, permission_type.include?(has_permission))
        @persons.push(personIndividual)
    end


    def create_teacher
        print 'age: '
        # gets.chomp  is used to get input
        # to_i is function to convert to integer
        age = gets.chomp.to_i
        print 'name: '
        name = gets.chomp
        print 'Specialization: '
        specs = gets.chomp
        personIndividual = Teacher.new(age, name, specs)
        @persons.push(personIndividual)
    end

    def list_books
        puts @books.inspect
        @books.each do |book|
            puts "title: \"#{book.title}\",
            Author : #{book.author}"
        end
    end

    def list_persons
        @persons.each do |person|
            person_type = person.instance_of?
            (Student) ? 'student' : 'teacher'
            puts "[#{person_type}] name: #{person.name}, id: #{person.id}, age : #{person.age}"
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
        rental = Rental.new(date, @books[book_index], @persons[person_index])
        @books[book_index].add_rental(rental)
        @persons[person_index].add_rental(rental)
        puts 'Rental created successfully'
      end
      
      def get_rental(id)
        person = @persons.find { |per| per.id == id }
        puts 'Rentals:'
        person.rentals.each do |rental|
          puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
        end
      end
      

end






















