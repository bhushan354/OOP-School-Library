class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book

    @person.rental << self
    book.rental << self
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
