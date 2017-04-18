class Customer
  attr_accessor :id
  attr_accessor :name, :address
  
  def initialize(attributes)
    @name = attributes[:name]
    @address = attributes[:address]
  end
end
