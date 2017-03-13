class Group < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :posts
  validates :title, presence: true
  has_many :group_relationships
  has_many :members, through: :group_relationships, source: :user
  has_one :onwer, through: :group_relationships, source: :user
end
