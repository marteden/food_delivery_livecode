require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'

require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'
require_relative 'router'

csv_meals = File.join(__dir__, 'app/data/meals.csv')
csv_customers = File.join(__dir__, 'app/data/customers.csv')

meal_repository = MealRepository.new(csv_meals)
customer_repository = CustomerRepository.new(csv_customers)

meals_controller = MealsController.new(meal_repository)
customers_controller = CustomersController.new(customer_repository)

router = Router.new(meals_controller, customers_controller)

router.run
