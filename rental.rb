class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.rentals << self
    person.rentals << self
  end

  def to_json(*_args)
    {
      'date' => @date,
      'book' => @book,
      'person' => @person
    }.to_json
  end

  def self.from_json(json_data, book, people)
    rental_data = JSON.parse(json_data)
    book = book.find { |b| b.title == rental_data['book']['title'] }
    person = people.find { |p| p.name == rental_data['person']['name'] }

    Rental.new(rental_data['date'], book, person)
  end

  def self.find_by_book(book, rentals)
    rentals.select { |r| r.book == book }
  end

  def self.find_by_person(person, rentals)
    rentals.select { |r| r.person == person }
  end
end
