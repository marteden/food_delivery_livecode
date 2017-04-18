class CustomersView
  def display(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name}"
    end
  end

  def ask_for(stuff)
    puts "What is the customer's #{stuff} ?"
    print ">"
    gets.chomp
  end
end
