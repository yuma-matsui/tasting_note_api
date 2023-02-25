# frozen_string_literal: true

class Taste < ApplicationRecord
  belongs_to :tasting_sheet

  with_options presence: true do
    validates :attack
    validates :sweetness
    validates :acidity
    validates :balance
    validates :alcohol
    validates :after_taste
  end
end
