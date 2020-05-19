require_relative '../views/meal_view'
require_relative '../models/meal'

class MealsController
  def initialize(meals_repository)

    # To the database 
    @meals_repository = meals_repository
    # To the view
    @meal_view = MealView.new
  end

  def add
    # Ask (puts) the user for name (gets.chomp)
    name = @meal_view.ask_for_name    
    # Ask (puts) the user for price (gets.chomp)
    price = @meal_view.ask_for_price    
    # Create a new meal instance with the values that we got from user (name, price)
    meal = Meal.new(name: name, price: price)
    # We need to save the meal instance in the repository
    @meals_repository.add(meal)
  end

  def list
    # grab the meals from the repo (repo.all)
    meals = @meals_repository.all
    # display the list of meals (view.display(meals))
    @meal_view.display(meals)
  end
end