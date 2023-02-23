class CreateTastingSheets < ActiveRecord::Migration[7.0]
  def change
    create_table :tasting_sheets do |t|
      t.string     :name,  null: false
      t.string     :color, null: false
      t.string     :time,  null: false
      t.belongs_to :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
