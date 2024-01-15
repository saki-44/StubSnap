class AddDateToStubs < ActiveRecord::Migration[7.0]
  def change
    add_column :stubs, :date, :date, null: false, default: -> { '(CURRENT_DATE)' }
  end
end
