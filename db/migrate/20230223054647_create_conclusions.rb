class CreateConclusions < ActiveRecord::Migration[7.0]
  def change
    create_table :conclusions do |t|
      t.string :evaluation,          null: false
      t.string :optimum_temperature, null: false
      t.string :glass,               null: false
      t.string :decantage
      t.string :vintage,             null: false
      t.string :country,             null: false
      t.string :grape,               null: false
      t.belongs_to :tasting_sheet,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
