class AddLatLonToHome < ActiveRecord::Migration
  def up
    add_column :homes, :lat, :string
    add_column :homes, :lon, :string
    remove_column :homes, :near_location
  end

  def down
    remove_column :homes, :lat
    remove_column :homes, :lon
    add_column :homes, :near_location, :string
  end
end
