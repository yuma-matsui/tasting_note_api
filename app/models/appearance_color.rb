# frozen_string_literal: true

class AppearanceColor < ApplicationRecord
  belongs_to :appearance

  validates :color, presence: true
end
