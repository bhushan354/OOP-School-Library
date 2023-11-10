class Rental

  attr_reader :book, :person
  attr_accessor :date

  def initialize(book, person, date)
    @book = book
    book.rentals <<self

    @person = person
    person.rentals << self

    @date = date
  end

end
