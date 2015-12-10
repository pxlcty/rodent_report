class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :animal
      t.datetime :datetime
      t.integer :number
      t.references :building, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
