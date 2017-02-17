class AddInfoToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :ord, :integer, null: false
    add_column :tracks, :bonus, :boolean, null: false
    add_column :tracks, :lyrics, :text

    add_index :tracks, [:album_id, :ord], unique: true
  end
end
