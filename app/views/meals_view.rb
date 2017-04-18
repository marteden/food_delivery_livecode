class MealsView
  def display(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} (#{meal.price}) euros"
    end
  end

  def ask_for(stuff)
    puts "What is the meal's #{stuff} ?"
    print ">"
    gets.chomp
  end
end
