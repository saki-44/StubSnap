class Category < ApplicationRecord
  has_many :stubs

  validates :name, presence: true, length: { maximum: 20 }
end
