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

end
