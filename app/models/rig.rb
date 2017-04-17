class Rig < ApplicationRecord

    has_many :rig_items
    has_many :items, :through => :rig_items

    belongs_to :user

    validates :name, :presence => true
    
    accepts_nested_attributes_for :items
end
