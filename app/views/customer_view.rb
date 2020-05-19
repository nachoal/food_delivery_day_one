class CustomerView
  def ask_for_name
    # - puts the question
    puts "What's the name of this customer?"
    # - Get the user input with gets.chomp
    gets.chomp
  end

  def ask_for_address
    puts "What's the address of this customer?"
    # - Get the user input with gets.chomp
    gets.chomp
  end

  def display(customers)
    # Iterate the customers
    customers.each do |customer|
      # puts the customer name
      puts "ID: #{customer.id} -#{customer.name} - #{customer.address}"
    end
  end
end