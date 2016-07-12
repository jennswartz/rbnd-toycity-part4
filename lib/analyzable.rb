module Analyzable
  
  @@data_path = File.dirname(__FILE__) + "/../data/data.csv"
  
  # Accept an array of product objects and return the average price.  Array is return (i.e.
  # the selection) of the Product.where method.  (Ave price can be totalled by brand or name of product) 
  def average_price(selection)
    total_price = selection.inject(0) { |total, product| total + product.price }
    average_price = total_price / selection.length
    return average_price.round(2)
  end
end
