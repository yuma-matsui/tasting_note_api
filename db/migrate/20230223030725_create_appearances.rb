class CreateAppearances < ActiveRecord::Migration[7.0]
  def change
    create_table :appearances do |t|
      t.string     :clarity,       null: false
      t.string     :brightness,    null: false
      t.string     :intensity,     null: false
      t.string     :consistency,   null: false
      t.belongs_to :tasting_sheet, null: false, foreign_key: true
      t.timestamps
    end
  end
end
