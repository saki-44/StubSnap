class CreateStubs < ActiveRecord::Migration[7.0]
  def change
    create_table :stubs do |t|
      t.string :title, null: false
      t.string :address
      t.text :memo
      t.integer :status, null: false, default: 0
      t.string :stub_image, null: false
      t.date :date, null: false, default: -> { '(CURRENT_DATE)' }
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
