class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  mount_uploader :icon_image, IconimageUploader
  
  has_many :posts
  has_many :comments

end
