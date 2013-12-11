require 'csv'
class Quota < Employee

  def calculate_net_pay
    super.to_f + (bonus - (bonus*@@tax))
  end

  def get_csv(sales)
    @sales = sales
  end

  def bonus
    check_bonus? ? @commibonus.to_f : 0
  end

  def check_bonus?
    Sale.new.monthly_sales(@name).to_f >= @quota.to_f
  end
end