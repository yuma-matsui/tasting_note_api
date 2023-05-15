# frozen_string_literal: true

class Wine < ApplicationRecord
  has_one :tasting_sheet, dependent: :nullify

  validates :name,    presence: true
  validates :vintage, presence: true
  validates :country, presence: true
  validates :grape,   presence: true

  def save_and_update_sheet(tasting_sheet_id)
    saved = true

    ActiveRecord::Base.transaction do
      saved &= save
      saved &= target_sheet(tasting_sheet_id).update(wine_id: id)

      raise ActiveRecord::Rollback unless saved
    end
    saved
  end

  private

  def target_sheet(tasting_sheet_id)
    TastingSheet.find(tasting_sheet_id)
  end
end
