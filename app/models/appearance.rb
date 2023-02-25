# frozen_string_literal: true

class Appearance < ApplicationRecord
  belongs_to :tasting_sheet
  has_many :appearance_colors,      dependent: :destroy
  has_many :appearance_impressions, dependent: :destroy

  validates :clarity,     presence: true
  validates :brightness,  presence: true
  validates :intensity,   presence: true
  validates :consistency, presence: true
end
