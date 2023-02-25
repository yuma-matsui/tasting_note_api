# frozen_string_literal: true

class TastingSheetForm < ApplicationForm
  attr_accessor :name, :color, :time, :appearance, :flavor, :taste, :conclusion, :user_id

  with_options presence: true do
    validates :name
    validates :color
    validates :time
  end

  def save
    saved = true
    tasting_sheet = TastingSheet.new(name: name, color: color, time: time, user_id: user_id)

    ActiveRecord::Base.transaction do
      saved &= tasting_sheet.save

      appearance_form = AppearanceForm.new(format_params(appearance, tasting_sheet.id))
      flavor_form = FlavorForm.new(format_params(flavor, tasting_sheet.id))

      saved &= appearance_form.valid? && appearance_form.save
      saved &= flavor_form.valid? && flavor_form.save
      saved &= Taste.new(format_params(taste, tasting_sheet.id)).save
      saved &= Conclusion.new(format_params(conclusion, tasting_sheet.id)).save

      raise ActiveRecord::Rollback unless saved
    end
    saved
  end

  private

  def format_params(params, tasting_sheet_id)
    params.merge(tasting_sheet_id: tasting_sheet_id)
  end
end
