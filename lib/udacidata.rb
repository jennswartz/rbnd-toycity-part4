require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
  create_finder_methods :brand, :name
  @@data_path = File.dirname(__FILE__) + "/../data/data.csv"


  def self.create(attributes = nil)
    check_csv = CSV.open(@@data_path, headers:true, converters: :all)# , "a+") #, headers:true, converters: :all)
    item = self.new(attributes)
    check_csv.each do |row|
      if row['id'].to_i == item.id.to_i
        return item
      end
    end
    item = self.new(attributes)
    CSV.open(@@data_path, "a+") do |csv|
      csv << [item.id, item.brand, item.name, item.price]
    item
    end
  end   
# 
#   def self.create(attributes = nil)
#       item = self.new(attributes)
#       CSV.open(@@data_path, "a+") do |csv|
#         csv << [item.id, item.brand, item.name, item.price]
#       item
#     end
#   end

#   def self.create(attributes = nil)
#       item = self.new(attributes)
#       CSV.open(@@data_path, "a+") do |csv|
#         csv << [item.id, item.brand, item.name, item.price]
#       item
#     end
#   end
  
  def self.all
    all_array = []
    CSV.foreach(@@data_path, headers: true, converters: :all) do |products|
      all_array << self.new(id: products["id"], brand: products["brand"], name: products["product"], price: products["price"])
    end
    all_array
  end 
  
  def self.first(n=1)
    result = self.all.first(n)
    result.length == 1 ? result[0] : result
  end
  
  def self.last(n=1)
    result = self.all.last(n)
    result.length == 1 ? result[0] : result
  end
  
  def self.find(id)
    result = self.all.find { |product| product.id == id }
    unless result 
      raise ProductNotFoundError, "No product found with that id."
    end
    result
  end
  
  def self.destroy(id)
    db = CSV.table(@@data_path, headers: true)
    item = find(id)
    db.delete_if { |item| item[:id] == id } 
    File.open(@@data_path, "w") { |save| save.write(db.to_csv) }
    item
  end
  
  def self.where(value={})
    selection = []
    if value[:brand]
      selection = self.all.select { |product| product.brand == value[:brand] } 
    elsif value[:name]
      selection = self.all.select { |product| product.name == value[:name] }
    end
    selection
  #self.all.select { |product| value[:brand] == product.brand || value[:name] == product.name }
  end
  
  def update(attributes = {}) 
    self.class.destroy(self.id)
    new_brand = attributes[:brand] ? attributes[:brand] : brand
    new_name = attributes[:name] ? attributes[:name] : name
    new_price = attributes[:price] ? attributes[:price] : price
    self.class.create(id: self.id, brand: new_brand, name: new_name, price: new_price)
  end
end