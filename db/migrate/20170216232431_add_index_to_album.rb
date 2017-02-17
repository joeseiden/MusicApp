class AddIndexToAlbum < ActiveRecord::Migration
  def change
    add_index :albums, [:band_id, :title], unique: true
  end
end
