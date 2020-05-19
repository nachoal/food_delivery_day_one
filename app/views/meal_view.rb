class MealView
  def ask_for_name
    # - puts the question
    puts "What's the name of this meal?"
    # - Get the user input with gets.chomp
    gets.chomp
  end

  def ask_for_price
    puts "What's the price of this meal?"
    # - Get the user input with gets.chomp
    gets.chomp.to_i
  end

  def display(meals)
    # Iterate the meals
    meals.each do |meal|
      # puts the meal name
      puts "ID: #{meal.id} -#{meal.name} -  $#{meal.price}"
    end
  end
end