require_relative '../classes/rental'
require 'rspec'
require 'date'

describe Rental do
  let(:book) { double('book', title: 'Sample Book', rentals: []) }
  let(:person) { double('person', name: 'John Doe', rentals: []) }

  it 'sets the date, book, and person' do
    date = Date.today
    rental = Rental.new(date, book, person)
    expect(rental.date).to eq(date)
    expect(rental.book).to eq(book)
    expect(rental.person).to eq(person)
  end

  it 'returns an empty array if no rentals are associated with the given book' do
    rentals = []
    result = Rental.find_by_book(book, rentals)

    expect(result).to be_empty
  end
end
