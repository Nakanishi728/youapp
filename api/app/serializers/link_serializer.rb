class LinkSerializer < ActiveModel::Serializer
  attributes :og_url, :og_title, :og_image, :og_description, :og_url, :id
  belongs_to :post
end
