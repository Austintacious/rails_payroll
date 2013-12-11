require 'csv'
class Owner < Employee

  def calculate_net_pay
    super.to_f + (bonus - (bonus*@@tax))
  end

  def get_csv(file)
    @sales = file
  end

  def check_bonus?
    Sale.new.monthly_sales > 250000
  end

  def bonus
    @commibonus.to_f if check_bonus?
  end
end