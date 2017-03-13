class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :groups
  has_many :posts
  has_many :events
  has_many :group_relationships
  has_many :owned_groups, :through => :group_relationships, :source => :group
  has_many :participated_groups, :through => :group_relationships, :source => :group
  def is_owner_of?(group)
    owned_groups.include?(group)
  end
  def own!(group)
    owned_groups << group
  end
  def disown!(group)
    owned_groups.delete(group)
  end
  def is_member_of?(group)
    participated_groups.include?(group)
  end
  def join!(group)
    participated_groups << group
  end
  def quit!(group)
    participated_groups.delete(group)
  end
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
