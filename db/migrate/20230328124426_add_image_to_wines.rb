class AddImageToWines < ActiveRecord::Migration[7.0]
  def change
    add_column :wines, :image, :string, default: nil
  end
end
