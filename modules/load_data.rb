require 'json'

module LoadData
  def load_data
    load_books
    load_people
    load_rentals
  end

  def load_books
    return unless File.exist?('./books.json') && !File.empty?('./books.json')

    json_data = File.read('./books.json')
    @books = JSON.parse(json_data).map { |book_data| Book.new(book_data['title'], book_data['author']) }
  end

  def load_people
    return unless File.exist?('./people.json') && !File.empty?('./people.json')

    json_data = File.read('./people.json')
    parsed_data = JSON.parse(json_data)
    @people = parsed_data.map do |person_data|
      case person_data['type']
      when 'Student'
        classroom = Classroom.new(person_data['classroom'])
        Student.new(classroom, age: person_data['age'], name: person_data['name'])
      when 'Teacher'
        Teacher.new(age: person_data['age'], name: person_data['name'])
      end
    end
  end

  def load_rentals
    return unless File.exist?('./rentals.json') && !File.empty?('./rentals.json')

    json_data = File.read('./rentals.json')
    @rentals = JSON.parse(json_data).map do |rental_data|
      book = find_book_by_title(rental_data['book_title'])
      person = find_person_by_name(rental_data['person_name'])
      Rental.new(rental_data['date'], book, person)
    end
  end

  def find_book_by_title(title)
    @books.find { |book| book.title == title }
  end

  def find_person_by_name(name)
    @people.find { |person| person.name == name }
  end
end