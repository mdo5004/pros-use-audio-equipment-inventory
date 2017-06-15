class RigSerializer < ActiveModel::Serializer
    attributes :id, :name, :venue, :use
    has_many :items, serializer: RigItemSerializer
    belongs_to :user, serializer: RigUserSerializer
end
