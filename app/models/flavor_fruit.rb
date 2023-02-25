# frozen_string_literal: true

class FlavorFruit < ApplicationRecord
  belongs_to :flavor

  validates :fruit, presence: true
end
