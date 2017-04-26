class Item < ApplicationRecord
    has_many :rig_items, dependent: :destroy
    has_many :rigs, :through => :rig_items    

    validates :name, :presence => true
    validates :manufacturer, :presence => true

    accepts_nested_attributes_for :rigs


    def rig_ids=(ids)
        ids.each do |id|
            if !id.empty?
                rig = Rig.find_by(id: id)
                self.rigs << rig unless (rig.empty? || self.rigs.include?(rig))
            end
        end
    end
    def count
        RigItem.joins(:item).where(:item_id => id).count()
    end
    def self.most_popular
        frequencies = RigItem.joins(:item).group(:item_id).count()
        sorted_freqs = frequencies.sort { |l,r| r[1] <=> l[1] }
        Item.find(sorted_freqs[0][0])
    end

    def self.top_ten
        frequencies = RigItem.joins(:item).group(:item_id).count()
        sorted_freqs = frequencies.sort { |l,r| r[1] <=> l[1] }
        if sorted_freqs.length > 9
            top_ten_ids = sorted_freqs[0..9].collect { |f| f[0] }
        else
            top_ten_ids = sorted_freqs.collect { |f| f[0] }
        end
        items = top_ten_ids.collect{ |f| Item.find(f) }
    end
     
end