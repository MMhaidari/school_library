require_relative '../classes/rental'
require 'rspec'

describe Rental do
  let(:date) {double('2020-01-12')}
  let(:person) {double('Ruler')}
  let(:book) {double('Peace')}
  let(:rental) {Rental.new(date, book, person)}

  it "Return the rental date, book and person" do
    expect(Rental.date).to eq('20202-01-12')
  end
end