class CreateAppearanceColors < ActiveRecord::Migration[7.0]
  def change
    create_table :appearance_colors do |t|
      t.string     :color,      null: false
      t.belongs_to :appearance, null: false, foreign_key: true
      t.timestamps
    end
  end
end
