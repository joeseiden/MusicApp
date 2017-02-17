class AddYearAndLiveToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :year, :integer,  null: false
    add_column :albums, :live, :boolean,  null: false, default: false
  end
end
