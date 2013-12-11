class Employee
  @@tax = 0.3

  attr_reader :name, :net_pay

  def initialize(row)
    @name = row["name"]
    @type = row["type"]
    @salary = row["salary"].to_f
    @commibonus = row["commibonus"].to_f
    @quota = row["quota"].to_f
  end

  def calculate_monthly_salary
    format_number(@salary.to_f/12)
  end

  def calculate_net_pay(employee)
    format_number(calculate_monthly_salary.to_f - (calculate_monthly_salary.to_f * @@tax))
  end

  def format_number(num)
    sprintf('%0.2f', num)
  end
end