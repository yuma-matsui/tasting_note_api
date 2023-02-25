# frozen_string_literal: true

class AppearanceForm < ApplicationForm
  attr_accessor :clarity, :brightness, :appearance_colors,
                :intensity, :appearance_impressions, :consistency, :tasting_sheet_id

  validates :tasting_sheet_id, presence: true
  validates :appearance_colors, :appearance_impressions, array_length_check: true

  def save
    saved = true
    appearance = Appearance.new(
      clarity: clarity,
      brightness: brightness,
      intensity: intensity,
      consistency: consistency,
      tasting_sheet_id: tasting_sheet_id
    )

    ActiveRecord::Base.transaction do
      saved &= appearance.save
      colors(appearance.id).each { |color| saved &= color.save }
      impressions(appearance.id).each { |impression| saved &= impression.save }

      raise ActiveRecord::Rollback unless saved
    end
    saved
  end

  private

  def colors(appearance_id)
    appearance_colors
      .map { |color| AppearanceColor.new(color: color, appearance_id: appearance_id) }
  end

  def impressions(appearance_id)
    appearance_impressions
      .map { |impression| AppearanceImpression.new(impression: impression, appearance_id: appearance_id) }
  end
end
