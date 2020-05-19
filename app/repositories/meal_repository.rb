class MealRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @meals         = []
    @next_id       = 1

    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @meals
  end

  def add(meal)
    # - Update the meal with the next_id
    meal.id = @next_id
    # - add the meal to the in memory list (@meals)
    @meals << meal
    # - increment next_id in preparation for the next meal that we are goign to add 
    @next_id += 1

    save_csv
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id]    = row[:id].to_i          # Convert column to Integer
      row[:price] = row[:price].to_i       # Convert column to Integer

      @meals << Meal.new(row)
    end

    @next_id = @meals.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << %w[id name price]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end