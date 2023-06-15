require 'json'
require_relative '../classes/book'
require_relative '../classes/rental'

describe Book do
  let(:title) { 'The Great Gatsby' }
  let(:author) { 'F. Scott Fitzgerald' }
  let(:book) { Book.new(title, author) }

  describe '#initialize' do
    it 'sets the title and author' do
      expect(book.title).to eq(title)
      expect(book.author).to eq(author)
    end

    it 'initializes an empty rentals array' do
      expect(book.rentals).to be_an(Array)
      expect(book.rentals).to be_empty
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the Book object' do
      json = book.to_json
      expect(json).to be_a(String)
      expect(JSON.parse(json)).to eq({
                                       'title' => title,
                                       'author' => author,
                                       'rentals' => []
                                     })
    end
  end
end
