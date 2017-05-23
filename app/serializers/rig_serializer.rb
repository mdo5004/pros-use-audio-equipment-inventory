class RigSerializer < ActiveModel::Serializer
    attributes :id, :name
    has_many :items, serializer: RigItemSerializer
end
