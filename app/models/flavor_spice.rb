# frozen_string_literal: true

class FlavorSpice < ApplicationRecord
  belongs_to :flavor

  validates :spice, presence: true
end
