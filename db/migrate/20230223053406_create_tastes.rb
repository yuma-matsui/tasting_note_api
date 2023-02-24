class CreateTastes < ActiveRecord::Migration[7.0]
  def change
    create_table :tastes do |t|
      t.string     :attack,        null: false
      t.string     :sweetness,     null: false
      t.string     :acidity,       null: false
      t.string     :bitterness
      t.string     :astringent
      t.string     :balance,       null: false
      t.string     :alcohol,       null: false
      t.string     :after_taste,   null: false
      t.belongs_to :tasting_sheet, null: false, foreign_key: true
      t.timestamps
    end
  end
end
