# frozen_string_literal: true

class Taste < ApplicationRecord
  belongs_to :tasting_sheet

  validates :attack,      presence: true
  validates :sweetness,   presence: true
  validates :acidity,     presence: true
  validates :balance,     presence: true
  validates :alcohol,     presence: true
  validates :after_taste, presence: true
end
