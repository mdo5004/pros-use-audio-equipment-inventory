class Item < ApplicationRecord
    has_many :rig_items
    has_many :rigs, :through => :rig_items    

    validates :name, :presence => true
    validates :manufacturer, :presence => true

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
        Item.where(:id => top_ten_ids).collect {|i| i.name}
    end
end
