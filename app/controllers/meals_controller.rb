require_relative '../views/meals_view'
require_relative '../models/meal'
require 'pry-byebug'
class MealsController
  def initialize(meals_repository)
    @meal_repository = meals_repository
    @meals_view = MealsView.new
  end

  def list
    meals = @meal_repository.all
    @meals_view.display(meals)
  end

  def add
    name = @meals_view.ask_for("name")
    price = @meals_view.ask_for("price").to_i
    meal = Meal.new(name: name, price: price)
    binding.pry
    @meal_repository.add(meal)
  end
end
