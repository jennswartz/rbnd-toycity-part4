module Analyzable
  
  # Takes an array of product objects and return the average price.  The array is the return
  # of the Product.where method.  Ave price is totalled by selecting brand or name of product
  # in the Product.where method. 
  def average_price(products)
    total_price = products.inject(0) { |total, product| total + product.price }
    average_price = total_price / products.length
    average_price.round(2)
  end
  
  # Accepts an array of Product objects (Product.all), and returns a hash with brand as value
  # and inventory as key
  def count_by_brand(products)
    brands = Hash.new
    products.each do |product| 
      brands.keys.include?(product.brand) ? brands[product.brand] +=1 : brands[product.brand] = 1
    end
    brands
  end

  
#   def count_by_name(args)
#   end
  
  # accept an array of Product objects and return a summary inventory report containing: 
  # average price, counts by brand, and counts by product name.
  def print_report(report)
    report = "string"   
#    
  end
end
