class PickupSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :post
  belongs_to :user
end
