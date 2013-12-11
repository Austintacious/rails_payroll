require 'csv'
class Sale
  def initialize
    @sales = CsvReader.new.parse_sales
  end

  def monthly_sales(name=nil)
    if name.nil?
      @gross_sales = []
      @sales.each do |row|
        @gross_sales << row["gross_sale_value"].to_f
      end
      @gross_sales.reduce(:+)
    else
      temp_array = []
      @sales.each do |row|
        temp_array << row["gross_sale_value"].to_f if row["last_name"] == name
        #binding.pry
      end

      temp_array.reduce(:+)
    end
  end
end