require_relative '../models/customer'
require 'csv'

class CustomerRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @customers     = []
    @next_id       = 1

    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @customers
  end

  def add(customer)
    # - Update the customer with the next_id
    customer.id = @next_id
    # - add the customer to the in memory list (@customer)
    @customers << customer
    # - increment next_id in preparation for the next customer that we are goign to add 
    @next_id += 1

    save_csv
  end

  def find(id)
    @customers.find { |customer| customer.id == id }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id]    = row[:id].to_i          # Convert column to Integer

      @customers << Customer.new(row)
    end

    @next_id = @customers.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << %w[id name address]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end