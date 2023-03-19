class CreateWines < ActiveRecord::Migration[7.0]
  def change
    create_table :wines do |t|
      t.string :name,               null: false
      t.string :vintage,            null: false
      t.string :country,            null: false
      t.string :region
      t.string :grape,              null: false
      t.string :alcohol_percentage, null: false
      t.text :memo
      t.timestamps
    end
  end
end
