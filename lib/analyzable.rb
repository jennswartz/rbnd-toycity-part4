module Analyzable
  
  @@data_path = File.dirname(__FILE__) + "/../data/data.csv"
  
  #accept an array of product objects and return the average price.  Average price is add up the 
  #prices and divide by the number of prices you added together
  def average_price(options = nil)
    sum = Product.create["sum.brand"].inject(0, :+)
    total = (sum.price.to_f / sum.price.length).round(2)
  end
end

# def calc_total_brand_price(brand)
#   $products_hash["items"].inject(0) { |total, product| product["brand"] == brand ?
#   		total + product["full-price"].to_f : total }
# end
# 
# def calc_ave_brand_price(brand, total_price)
#   brand_products = $products_hash["items"].select { |product| product["brand"] == brand }
#   return (total_price / brand_products.length).round(2)
# end


  
 