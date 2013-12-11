
class Pay


  attr_reader :employees

  def initialize
    @sales = "./db/data/sales_data.csv"
    @employeesfile = "./db/data/employees.csv"
    @employees = {}
  end

  def populate_employees
    list = CsvReader.new.parse_employees
    list.each do |row|
      var = row["type"]
      #binding.pry
      if var == "owner"
        @employees[row["name"]] = Owner.new(row)
        @employees[row["name"]].get_csv(@sales)
      elsif var == "commission"
        @employees[row["name"]] = Commission.new(row)
        @employees[row["name"]].get_csv(@sales)
      elsif var == "quota"
        @employees[row["name"]] = Quota.new(row)
        @employees[row["name"]].get_csv(@sales)
      else
        @employees[row["name"]] = Employee.new(row)
      end

    end
    @employees
  end

  def list_employees
    puts @employees.keys
  end

  def find_monthly_gross
    puts Sale.new.monthly_sales
  end

  def monthly_salary(employee)
    #binding.pry
    # raise "Employee is not found. Did you run populate_employees?" unless @employees.include?(employee)
    # puts "Gross Salary: $#{@employees[employee].calculate_monthly_salary}"
    "***#{@employees[employee].name}***"
    "Commission: $#{@employees[employee].determine_commission(@employees[employee].name)}"
    "Net Pay: $#{@employees[employee].calculate_net_pay(@employees[employee].name)}"
    # puts "Bonus: $#{@employees[employee].bonus}" if @employees[employee].class == Owner || @employees[employee].class == Quota
    # puts "--------------------"
  end

  def display_commissioned(name)
    monthly_salary(name)
  end
end
