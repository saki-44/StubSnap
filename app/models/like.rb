class Like < ApplicationRecord
  belongs_to :user
  belongs_to :stub

  validates :user_id, uniqueness: { scope: :user_id }
end
