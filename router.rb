class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    while @running
      puts "- Food Delivery Power APP -"
      print_menu
      action = gets.chomp.to_i
      print `clear`
      dispatch(action)
    end
  end

  private

  def print_menu
    puts "======================"
    puts "1. List all meals"
    puts "2. Add a new meal"
    puts "3. List all customers"
    puts "4. Add a new customer"
    puts "0. Exit Program"
    puts "======================"
  end

  def dispatch(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 0 then @running = false
    end
  end
end
