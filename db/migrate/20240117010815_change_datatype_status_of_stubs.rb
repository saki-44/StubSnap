class ChangeDatatypeStatusOfStubs < ActiveRecord::Migration[7.0]
  def change
    change_column :stubs, :status, :integer, default: 0
  end
end
