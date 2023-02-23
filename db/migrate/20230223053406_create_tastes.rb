class CreateTastes < ActiveRecord::Migration[7.0]
  def change
    create_table :tastes do |t|
      t.string :attack,            null: false
      t.string :sweetness,         null: false
      t.string :acidity,           null: false
      t.string :bitterness,        default: nil
      t.string :astringent,        default: nil
      t.string :balance,           null: false
      t.string :alcohol,           null: false
      t.string :afterTaste,        null: false
      t.belongs_to :tasting_sheet, null: false, foreign_key: true
      t.timestamps
    end
  end
end
