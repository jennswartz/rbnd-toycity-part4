module Analyzable
  

  def total_price(brand)
    Product.where(brand: "AverageBrand").inject(0) { |total, product| product["brand"] == brand ? total + product["full-price"].to_f : total }
  end
  
  def average_price(brand, total_price)
    brand_product = Brand.where(brand: "AverageBrand").select { |product| product["brand"] == brand }
    return (total_price / brand_products.length).round(2)
  end
end
    



  
#   def average_price(self.all, total_price)
#     brand_products = self.all.select { |product| product["brand"] == brand }
#     return (total_price / brand_products.length).round(2)
#   end
  
  


end
