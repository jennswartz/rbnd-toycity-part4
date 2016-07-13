module Analyzable
  
  # Takes an array of objects and returns the average price.
  def average_price(products)
    total_price = products.inject(0) { |total, product| total + product.price }
    average_price = total_price / products.length
    average_price.round(2)
  end
  
  # Taks an array of objects, and returns a hash with brand as value and inventory as key
  def count_by_brand(products)
    brands = Hash.new
    products.each do |product| 
      brands.keys.include?(product.brand) ? brands[product.brand] += 1 : brands[product.brand] = 1
    end
    brands
  end
  
  # Takes an array of objects and returns a hash with inventory counts (name is key, inventory is value)
  def count_by_name(products)
    name = Hash.new
    products.each do |product|
      name.keys.include?(product.name) ? name[product.name] += 1 : name[product.name] = 1
    end
    name
  end
  
  def print_report(products)
    report = "Summary Report\n"
    report += "Inventory by Brand:\n"
    count_by_brand(products).each do |brand, inventory|
      report += " - #{brand}:  #{inventory}\n"
    end
    report += "Inventory by Name:\n"
    count_by_name(products).each do |name, inventory|
     report += " - #{name}:  #{inventory}\n"
    end
    report
  end 
end
