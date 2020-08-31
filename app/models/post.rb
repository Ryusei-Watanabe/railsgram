class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :content, length:{in:1..140}
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
