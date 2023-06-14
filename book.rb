class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end

  def to_json(*_args)
    {
      'title' => @title,
      'author' => @author,
      'rentals' => @rentals
    }.to_json
  end

  def self.from_json(json_data)
    book_data = JSON.parse(json_data)
    Book.new(book_data['title'], book_data['author'], book_data['rentals'])
  end
end
