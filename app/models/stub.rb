class Stub < ApplicationRecord
  mount_uploader :stub_image, StubImageUploader
  belongs_to :user
  belongs_to :category

  validates :title, presence: true, length: { maximum: 255 }
  validates :memo, length: { maximum: 65_535 }

  # 公開stubのスコープ
  scope :public_stubs, -> { where(public: true) }
  # 特定ユーザーに属するstubのスコープ
  scope :user_stubs, ->(user) { where(user_id: user.id) }
end
