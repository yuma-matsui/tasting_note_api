class CreateFlavorImpressions < ActiveRecord::Migration[7.0]
  def change
    create_table :flavor_impressions do |t|
      t.string     :impression, null: false
      t.belongs_to :flavor,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
