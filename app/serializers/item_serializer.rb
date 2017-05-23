class ItemSerializer < ActiveModel::Serializer
    attributes :id, :name, :classification, :manufacturer, :make, :model, :year, :link
end
