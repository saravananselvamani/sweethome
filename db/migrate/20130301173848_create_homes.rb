class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :name
      t.text :address
      t.string :home_phone
      t.string :office_phone
      t.references :person
      t.timestamps
    end
  end
end
