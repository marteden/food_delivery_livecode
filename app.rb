require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/employee_repository'

require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'
require_relative 'app/controllers/sessions_controller'

require_relative 'router'

csv_meals = File.join(__dir__, 'app/data/meals.csv')
csv_customers = File.join(__dir__, 'app/data/customers.csv')
csv_employees = File.join(__dir__, 'app/data/employees.csv')

meal_repository = MealRepository.new(csv_meals)
customer_repository = CustomerRepository.new(csv_customers)
employee_repository = EmployeeRepository.new(csv_employees)

meals_controller = MealsController.new(meal_repository)
customers_controller = CustomersController.new(customer_repository)
sessions_controller = SessionsController.new(employee_repository)

router = Router.new(meals_controller, customers_controller, sessions_controller)

router.run
