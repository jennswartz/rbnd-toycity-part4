class Module
    
  def create_finder_methods(*attributes)
    attributes.each do |attribute|
	  find_by = %Q{
		def self.find_by_#{attribute}(value)
		  self.all.find { |items| items.#{attribute} == value }
		end
		}
		class_eval(find_by)
    end
  end
end
