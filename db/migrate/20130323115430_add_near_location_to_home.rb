class AddNearLocationToHome < ActiveRecord::Migration
  def change
    add_column :homes, :near_location, :string
  end
end
