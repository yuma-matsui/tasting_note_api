# frozen_string_literal: true

class Conclusion < ApplicationRecord
  belongs_to :tasting_sheet

  with_options presence: true do
    validates :evaluation
    validates :optimum_temperature
    validates :glass
    validates :vintage
    validates :country
    validates :grape
  end
end
