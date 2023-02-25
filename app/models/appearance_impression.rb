# frozen_string_literal: true

class AppearanceImpression < ApplicationRecord
  belongs_to :appearance

  validates :impression, presence: true
end
