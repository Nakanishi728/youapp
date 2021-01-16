class Post < ApplicationRecord
  belongs_to :user
  has_many :links, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :pickups, dependent: :destroy
  validates :title, presence: true, length: { maximum: 30 }
  validates :point, presence: true, length: { maximum: 140 }
end
