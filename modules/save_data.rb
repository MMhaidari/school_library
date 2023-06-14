require 'json'

module SaveData
  def save_data(books, people, rentals)
    save_books(books)
    save_people(people)
    save_rentals(rentals)
  end

  def save_books(books)
    File.open("./books.json", "w") do |file|
      json_data = JSON.pretty_generate(books.map(&:to_json))
      file.write(json_data)
    end
    puts 'Books saved successfully!'
  end

  def save_people(people)
    File.open("./people.json", "w") do |file|
      json_data = JSON.pretty_generate(people.map(&:to_json))
      file.write(json_data)
    end
    puts 'People saved successfully!'
  end

  def save_rentals(rentals)
    File.open("./rentals.json", "w") do |file|
      json_data = JSON.pretty_generate(rentals.map(&:to_json))
      file.write(json_data)
    end
    puts 'Rentals saved successfully!'
  end
end
