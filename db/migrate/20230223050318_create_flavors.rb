class CreateFlavors < ActiveRecord::Migration[7.0]
  def change
    create_table :flavors do |t|
      t.belongs_to :tasting_sheet, null: false, foreign_key: true
      t.timestamps
    end
  end
end
