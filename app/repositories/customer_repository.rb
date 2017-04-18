class CustomerRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @customers = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def add(customer)
    customer.id = @next_id
    @next_id += 1
    @customers << customer
    write_csv
  end

  def all
    @customers
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      @customers << Customer.new(row)
    end
    @customers.empty? ? @next_id = 1 : @next_id = @customers.last.id + 1
  end

  def write_csv
    CSV.open(@csv_file, 'w') do |csv|
      csv << ["id", "name", "address"]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end
