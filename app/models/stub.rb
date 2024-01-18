class Stub < ApplicationRecord
  mount_uploader :stub_image, StubImageUploader
  belongs_to :user
  belongs_to :category

  validates :title, presence: true, length: { maximum: 255 }
  validates :memo, length: { maximum: 65_535 }

  enum status: { unpublished: 0, published: 1 }
end
