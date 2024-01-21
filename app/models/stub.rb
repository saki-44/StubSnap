class Stub < ApplicationRecord
  mount_uploader :stub_image, StubImageUploader
  belongs_to :user
  belongs_to :category
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 20 }
  validates :memo, length: { maximum: 65_535 }

  enum status: { unpublished: 0, published: 1 }

  def liked?(user)
    likes.where(user_id: user.id).exists?
  end
end
