# frozen_string_literal: true

class WineForm < ApplicationForm
  attr_accessor :name, :image, :vintage, :country, :region,
                :grape, :alcohol_percentage, :memo, :tasting_sheet_id

  with_options presence: true do
    validates :name
    validates :vintage
    validates :country
    validates :grape
  end

  def save
    saved = true
    wine = Wine.new(
      name: name,
      image: image,
      vintage: vintage,
      country: country,
      region: region,
      grape: grape,
      alcohol_percentage: alcohol_percentage,
      memo: memo
    )

    ActiveRecord::Base.transaction do
      saved &= wine.save
      saved &= tasting_sheet.update(wine_id: wine.id)

      raise ActiveRecord::Rollback unless saved
    end
    saved
  end

  def wine_record
    tasting_sheet.wine
  end

  private

  def tasting_sheet
    TastingSheet.find(tasting_sheet_id)
  end
end
