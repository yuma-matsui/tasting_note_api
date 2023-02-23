# frozen_string_literal: true

class FlavorFlower < ApplicationRecord
  belongs_to :flavor

  validates :flower, presence: true
end
