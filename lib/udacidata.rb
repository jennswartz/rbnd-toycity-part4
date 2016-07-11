require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata

  @@data_path = File.dirname(__FILE__) + "/../data/data.csv"

  def self.create(attributes = {})
#     if attributes[:id]
#       #there is supposed to be some code in here to find it in the database, I think but passed test without it
#       item = self.new(attributes) #this ends up being like below unless I create a find method somehow
#       return item
#     end
    item = self.new(attributes)
    CSV.open(@@data_path, "ab") do |csv|
      csv << [item.id, item.brand, item.name, item.price]
    end
    return item
  end
  
  def self.all
    array = []
    CSV.foreach(@@data_path, headers: true) do |products|
      array << self.new(id: products["id"].to_i, brand: products["brand"], name: products["product"], price: products["price"].to_i)
    end
    return array
  end 
end