# frozen_string_literal: true

class Conclusion < ApplicationRecord
  belongs_to :tasting_sheet

  validates :evaluation,          presence: true
  validates :optimum_temperature, presence: true
  validates :glass,               presence: true
  validates :vintage,             presence: true
  validates :country,             presence: true
  validates :grape,               presence: true
end
