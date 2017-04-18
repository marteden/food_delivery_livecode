require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @employees = []
    load_csv
  end

  private

  def load_csv
    options = {headers: :first_row, header_converters: :symbol}
    CSV.foreach(@csv_file, options) do |row|
      row[:id] = row[:id].to_i
      @employees << Employee.new(row)
    end
  end
end
