class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :name
      t.text :address
      t.string :home_phone
      t.string :office_phone
      t.boolean :rent_or_sale
      t.integer :amount
      t.references :person
      t.timestamps
    end
  end
end
