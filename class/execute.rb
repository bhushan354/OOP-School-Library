def execute_option(app, number)
  option_methods = {
    1 => :list_all_books,
    2 => :list_persons,
    3 => :create_person,
    4 => :create_book_option,
    5 => :create_rental,
    6 => :get_rental_option,
    7 => :exit_app
  }

  if option_methods.key?(number)
    send(option_methods[number], app)
  else
    puts 'Enter valid number'
    main(app)
  end
end

def exit_app(*)
  puts 'Thank you for using Terminal App, Hope you liked it !'
end
