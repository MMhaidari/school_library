module SaveData
  def save_data
    save_books
    save_people
    save_rentals
  end

  def save_books
    json_data = @books.map { |book| { title: book.title, author: book.author } }
    File.write('books.json', JSON.pretty_generate(json_data))
    puts 'Books saved successfully'
  end

  def save_people
    json_data = @people.map do |person|
      if person.is_a?(Student)
        {
          type: 'Student',
          name: person.name,
          age: person.age,
          parent_permission: person.parent_permission?,
          classroom: person.classroom.to_s
        }
      elsif person.is_a?(Teacher)
        {
          type: 'Teacher',
          name: person.name,
          age: person.age,
          specialization: person.specialization
        }
      end
    end
    File.write('people.json', JSON.pretty_generate(json_data))
    puts 'People saved successfully'
  end

  def save_rentals
    json_data = @rentals.map do |rental|
      {
        book_title: rental.book.title,
        person_name: rental.person.name,
        date: rental.date
      }
    end
    File.write('rentals.json', JSON.pretty_generate(json_data))
    puts 'Rentals saved successfully'
  end
end
