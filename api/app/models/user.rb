class User < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one_attached :avatar
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  def avatar_url
    avatar.attached? ?  url_for(avatar) : nil
  end
end
