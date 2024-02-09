class Stub < ApplicationRecord
  mount_uploader :stub_image, StubImageUploader
  belongs_to :user
  belongs_to :category
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 20 }
  validates :memo, length: { maximum: 65_535 }
  validates :stub_image, presence: true

  enum status: { unpublished: 0, published: 1 }

  def liked?(user)
    likes.where(user_id: user.id).exists?
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[category likes user]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[memo title]
  end
end
