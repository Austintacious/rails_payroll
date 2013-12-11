require 'csv'

class SalesController < ApplicationController
  def index
    # make your sales objects available to the correlating view here
    x = CsvReader.new
    @sales_array = x.parse_sales

    y = Pay.new
    y.populate_employees
    @commissioned = y.display_commissioned("Ricky Bobby")
    @commissioned2 = y.display_commissioned("Bob Lob")
    
  end
end
