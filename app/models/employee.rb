class Employee
  attr_accessor :id
  attr_reader :name, :password, :role

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @password = attributes[:password]
    @role = attributes[:role]
  end
end
