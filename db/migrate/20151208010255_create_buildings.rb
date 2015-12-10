class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :houseno
      t.string :streetname
      t.string :borough
      t.string :city
      t.string :state
      t.string :neighborhood
      t.integer :block
      t.integer :lot
      t.integer :bin

      t.timestamps null: false
    end
  end
end
