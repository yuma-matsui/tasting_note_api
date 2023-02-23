# frozen_string_literal: true

class FlavorImpression < ApplicationRecord
  belongs_to :flavor

  validates :impression, presence: true
end
