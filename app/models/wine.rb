# frozen_string_literal: true

class Wine < ApplicationRecord
  has_one :tasting_sheet, dependent: :nullify

  validates :name,    presence: true
  validates :vintage, presence: true
  validates :country, presence: true
  validates :grape,   presence: true
end
