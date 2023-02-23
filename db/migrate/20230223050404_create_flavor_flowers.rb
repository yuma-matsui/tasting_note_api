class CreateFlavorFlowers < ActiveRecord::Migration[7.0]
  def change
    create_table :flavor_flowers do |t|
      t.string     :flower, null: false
      t.belongs_to :flavor, null: false, foreign_key: true
      t.timestamps
    end
  end
end
