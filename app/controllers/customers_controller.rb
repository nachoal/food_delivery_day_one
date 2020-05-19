require_relative '../views/customer_view'
require_relative '../models/customer'

class CustomersController
  def initialize(customers_repository)

    # To the database 
    @customers_repository = customers_repository
    # To the view
    @customer_view = CustomerView.new
  end

  def add
    # Ask (puts) the user for name (gets.chomp)
    name = @customer_view.ask_for_name    
    # Ask (puts) the user for address (gets.chomp)
    address = @customer_view.ask_for_address    
    # Create a new meal instance with the values that we got from user (name, address)
    customer = Customer.new(name: name, address: address)
    # We need to save the meal instance in the repository
    @customers_repository.add(customer)
  end

  def list
    # grab the customers from the repo (repo.all)
    customers = @customers_repository.all
    # display the list of customers (view.display(customers))
    @customer_view.display(customers)
  end
end