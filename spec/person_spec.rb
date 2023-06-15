require_relative '../classes/person'

describe Person do
  let(:book) { double('Book') }
  let(:date) { double('Date') }
  let(:person) { Person.new(age: 20, name: 'John', parent_permission: true) }

  describe '#initialize' do
    it 'sets the age' do
      expect(person.age).to eq(20)
    end

    it 'sets the name' do
      expect(person.name).to eq('John')
    end

    it 'sets the parent permission' do
      expect(person.instance_variable_get(:@parent_permission)).to be true
    end

    it 'initializes rentals as an empty array' do
      expect(person.rentals).to eq([])
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      expect(person.correct_name).to eq('John')
    end
  end

  describe '#add_rental' do
    it 'creates a new rental with the given book and date' do
      expect(Rental).to receive(:new).with(date, book, person)
      person.add_rental(book, date)
    end
  end

  describe '#can_use_services?' do
    context 'when parent permission is true' do
      it 'returns true' do
        expect(person.can_use_services?).to be true
      end
    end

    context 'when age is 18 or above' do
      let(:person) { Person.new(age: 18, parent_permission: false) }

      it 'returns true' do
        expect(person.can_use_services?).to be true
      end
    end

    context 'when parent permission is false and age is below 18' do
      let(:person) { Person.new(age: 15, parent_permission: false) }

      it 'returns false' do
        expect(person.can_use_services?).to be false
      end
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the person' do
      expected_json = {
        'type' => 'Person',
        'name' => 'John',
        'age' => 20,
        'parent_permission' => true
      }.to_json

      expect(person.to_json).to eq(expected_json)
    end
  end
end
