require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata

  @@data_path = File.dirname(__FILE__) + "/../data/data.csv"

  def self.create(attributes = nil)
    if attributes[:id]
      self.new(attributes)
    else 
      item = self.new(attributes)
      CSV.open(@@data_path, "ab") do |csv|
        csv << [item.id, item.brand, item.name, item.price]
      end
      item
    end
  end
  
  def self.all
    all_array = []
    CSV.foreach(@@data_path, headers: true) do |products|
      all_array << self.new(id: products["id"], brand: products["brand"], name: products["product"], price: products["price"])
    end
    all_array
  end 
end