class AddWineIdToTastingSheets < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasting_sheets, :wine, foreign_key: true, default: nil
  end
end
