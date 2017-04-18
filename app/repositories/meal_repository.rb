require 'csv'
require 'pry-byebug'

require_relative '../models/meal'

class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def add(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    write_csv
  end

  def all
    @meals
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
    @meals.empty? ? @next_id = 1 : @next_id = @meals.last.id + 1
  end

  def write_csv
    CSV.open(@csv_file, 'w') do |csv|
      csv << ["id", "name", "price"]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
