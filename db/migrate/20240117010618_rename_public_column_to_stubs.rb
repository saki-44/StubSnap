class RenamePublicColumnToStubs < ActiveRecord::Migration[7.0]
  def change
    rename_column :stubs, :public, :status
  end
end
