class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :original
      t.string :shrunk

      t.timestamps
    end
  end
end
