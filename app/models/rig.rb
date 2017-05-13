class Rig < ApplicationRecord

    has_many :rig_items, dependent: :destroy
    has_many :items, :through => :rig_items

    belongs_to :user

    validates :name, :presence => true
    
#    accepts_nested_attributes_for :items, reject_if: proc { |attributes| attributes['title'].blank? }
    
    def items_attributes=(items)
        items.each do |item|
            new_item = Item.find_or_create_by(item[1])
            self.items << new_item unless self.items.include? (new_item)
        end
    end
    
    def item_count
        items.count 
    end
    
    def user_name
        user.name
    end
end
