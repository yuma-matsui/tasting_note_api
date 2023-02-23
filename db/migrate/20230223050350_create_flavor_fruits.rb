class CreateFlavorFruits < ActiveRecord::Migration[7.0]
  def change
    create_table :flavor_fruits do |t|
      t.string     :fruit,  null: false
      t.belongs_to :flavor, null: false, foreign_key: true
      t.timestamps
    end
  end
end
