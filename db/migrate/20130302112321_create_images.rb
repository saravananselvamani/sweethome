class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.references :owner, :polymorphic => true
      t.timestamps
    end
  end
end
