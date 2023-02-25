# frozen_string_literal: true

class FlavorFirstImpression < ApplicationRecord
  belongs_to :flavor

  validates :first_impression, presence: true
end
