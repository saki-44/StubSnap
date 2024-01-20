class Like < ApplicationRecord
  belongs_to :user
  belongs_to :stub

  validates :user, presence: true
  validates :stub, presence: true
  validates :user_id, uniqueness: { scope: :stub_id }
end
