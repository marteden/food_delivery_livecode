require_relative 'app/models/meal'
require_relative 'app/repositories/meal_repository'

csv_file = File.join(__dir__, 'app/data/meals.csv')
repo = MealRepository.new(csv_file)
meal1 = Meal.new(name: 'quiche', price: 5)
meal2 = Meal.new(name: 'tourte', price: 5)

repo.add(meal1)
repo.add(meal2)
p repo.all
