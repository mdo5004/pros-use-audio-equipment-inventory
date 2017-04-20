class RigItem < ApplicationRecord
    belongs_to :rig
    belongs_to :item
    after_update :clear_orphaned_items

    def self.clear_orphaned_items
        RigItem.where(["item_id NOT IN (?) OR rig_id NOT IN (?)",
            Item.pluck("id"),
            Rig.pluck("id")
            ]).destroy_all
    end

end
