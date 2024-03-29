class Category < ApplicationRecord
  has_many :stubs

  validates :name, presence: true, length: { maximum: 20 }

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id name updated_at]
  end

  def translated_name
    I18n.t("categories.#{name}")
  end
end
