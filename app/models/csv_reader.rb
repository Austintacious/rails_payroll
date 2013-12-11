require 'csv'

class CsvReader
  def initialize
    @file = "./db/data/sales_data.csv"
  end

  def parse_employees
    headers = CSV.open("./db/data/employees.csv", 'r') { |csv| csv.first }
    temp_array = []
    unless headers == ["name", "type", "salary", "commibonus", "quota"]
      raise "Not a valid Employee CSV file. Please ensure the headers include 'name', 'type', 'salary', 'commibonus', and 'quota'."
    else
      CSV.foreach("./db/data/employees.csv", headers:true) do |row|
        temp_array << row
      end
      temp_array
    end
  end

  def parse_sales
    headers = CSV.open(@file, 'r') { |csv| csv.first }
    sales_array = []
    unless headers == ["last_name", "gross_sale_value"]
      raise "Not a valid Sales CSV file. Please ensure the headers include 'last_name' and 'gross_sale_value'."
    else
      CSV.foreach(@file, headers:true) do |row|
        sales_array << row
      end
      sales_array
    end
  end
end