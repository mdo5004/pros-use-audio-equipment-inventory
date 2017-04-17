class Item < ApplicationRecord
    has_many :rig_items
    has_many :rigs, :through => :rig_items    
    
    validates :name, :presence => true
    validates :manufacturer, :presence => true
    
end
