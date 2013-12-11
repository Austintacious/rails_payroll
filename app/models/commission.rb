require 'csv'
class Commission < Employee
  def calculate_net_pay(employee)
    super.to_f + (determine_commission(employee) - (determine_commission(employee)*@@tax))
  end

  def determine_commission(employee)
    @commibonus.to_f*Sale.new.monthly_sales(employee).to_f
  end

  def get_csv(sales)
    @sales = sales
  end
end