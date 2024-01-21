class Like < ApplicationRecord
  belongs_to :user
  belongs_to :stub

  validates :user, presence: true
  validates :stub, presence: true
  validates :user_id, uniqueness: { scope: :stub_id }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "stub_id", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["stub", "user"]
  end

end
