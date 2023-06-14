module SaveData
    def save_data
        save_books
        save_people
        save_rentals
    end

    def save_books
        File.open("./books.json", "a")
            json_data = JSON.pretty_generate(@book.map(&:to_json))
            File.write(json_data)            
    end

    def save_people
        File.open("./people.json", "a")
            json_data = JSON.pretty_generate(@people.map(&:to_json))
            File.write(json_data)            
    end

    def save_rentals
        File.open("./rentals.json", "a")
            json_data = JSON.pretty_generate(@rentals.map(&:to_json))
            File.write(json_data)            
    end
end
