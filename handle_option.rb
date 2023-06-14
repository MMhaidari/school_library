def handle_option(option, app)
  option_actions = {
    1 => :list_all_books,
    2 => :list_all_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals,
    7 => :quit
  }

  action = option_actions[option]

  if action
    app.send(action)
  else
    puts 'Invalid option!'
  end
end
