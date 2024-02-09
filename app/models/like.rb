class Like < ApplicationRecord
  belongs_to :user
  belongs_to :stub

  validates :user, presence: true
  validates :stub, presence: true
  validates :user_id, uniqueness: { scope: :stub_id }

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id stub_id updated_at user_id]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[stub user]
  end
end
