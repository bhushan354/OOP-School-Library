class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(book, person, date)
    @book = book
    book.rentals << self

    @person = person
    person.rentals << self

    @date = date
  end
end
