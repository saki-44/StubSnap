class AddStubImageToStubs < ActiveRecord::Migration[7.0]
  def change
    add_column :stubs, :stub_image, :string, null: false
  end
end
