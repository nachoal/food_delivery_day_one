class Router

  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end
  def run
    while @running
      puts "--------------------"
      puts "------- MENU -------"
      puts "--------------------"
      puts "1. Add new meal"
      puts "2. List all meals"
      puts "3. Add new customer"
      puts "4. List all customers"
      puts "8. Exit"
      print "> "

      user_choice = gets.chomp.to_i
      print `clear`
      case user_choice
      when 1 then @meals_controller.add
      when 2 then @meals_controller.list
      when 3 then @customers_controller.add
      when 4 then @customers_controller.list
      when 8 then @running = false
      end

    end
  end
end