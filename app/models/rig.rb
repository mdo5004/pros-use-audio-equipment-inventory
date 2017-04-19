class Rig < ApplicationRecord

    has_many :rig_items
    has_many :items, :through => :rig_items

    belongs_to :user

    validates :name, :presence => true
    
    accepts_nested_attributes_for :items
    
    def items_attributes=(items)
        items.each do |item|
            new_item = Item.find_or_create_by(name: item[:name])
            self.items << new_item
        end
    end
    
    def item_count
        items.count 
    end
    
    def user_name
        user.name
    end
end
