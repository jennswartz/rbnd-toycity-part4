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
      brands.keys.include?(product.brand) ? brands[product.brand] += 1 : brands[product.brand] = 1
    end
    brands
  end
  
  # Accepts an array of Product objects (Product.all), and returns a hash with inventory counts
  # organize by product name; product name is key, inventory count is value
  def count_by_name(products)
    name = Hash.new
    products.each do |product|
      name.keys.include?(product.name) ? name[product.name] += 1 : name[product.name] = 1
    end
    name
  end
  
  # accept an array of Product objects and return a summary inventory report containing: 
  # average price, counts by brand, and counts by product name.
  def print_report(products)
    report = "#{self}\n"
    report += "Inventory by Brand:\n"
    count_by_brand(products).each do |key, value|
      report += " - #{key}:  #{value}\n"
    end
    report += "Inventory by Name:\n"
    count_by_name(products).each do |key, value|
     report += " - #{key}:  #{value}\n"
    end
    report
  end 
end
