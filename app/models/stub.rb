class Stub < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :title, presence: true, length: { maximum: 255 }
  validates :memo, length: { maximum: 65_535 }
end
