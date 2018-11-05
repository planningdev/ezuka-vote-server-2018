class Image < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :image, presence: true

  belongs_to :imageable, polymorphic: true
end
