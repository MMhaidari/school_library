require 'json'

module SaveData
  def save_data(books, people, rentals)
    @books = books
    @people = people
    @rentals = rentals

    save_books
    save_people
    save_rentals
  end

  def save_books
    File.open('./books.json', 'w') do |file|
      json_data = JSON.pretty_generate(@books.map(&:to_json))
      file.write(json_data)
    end
    puts 'Books saved successfully'
  end

  def save_people
    File.open('./people.json', 'w') do |file|
      json_data = JSON.pretty_generate(@people.map(&:to_json))
      file.write(json_data)
    end
    puts 'People saved successfully'
  end

  def save_rentals
    File.open('./rentals.json', 'w') do |file|
      json_data = JSON.pretty_generate(@rentals.map(&:to_json))
      file.write(json_data)
    end
    puts 'Rentals saved successfully'
  end
end