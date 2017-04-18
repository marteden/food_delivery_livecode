class SessionsView
  def ask_for_name
    puts "Name ?"
    gets.chomp
  end

  def ask_for_password
    puts "Password ?"
    gets.chomp
  end

  def wrong_credentials
    puts "Wrong credentials... Try again"
  end
end
