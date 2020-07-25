class RenameUrlField < ActiveRecord::Migration[6.0]
  def change
    rename_column :urls, :shrunk, :digest
  end
end
