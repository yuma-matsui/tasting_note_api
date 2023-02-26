# frozen_string_literal: true

class TastingSheet < ApplicationRecord
  belongs_to :user
  has_one :appearance, dependent: :destroy
  has_one :flavor,     dependent: :destroy
  has_one :taste,      dependent: :destroy
  has_one :conclusion, dependent: :destroy

  validates :name,  presence: true
  validates :color, presence: true
  validates :time,  presence: true

  scope :with_relations, lambda {
    includes(
      :taste,
      :conclusion,
      appearance: %i[
        appearance_colors
        appearance_impressions
      ],
      flavor: %i[
        flavor_first_impressions
        flavor_fruits
        flavor_flowers
        flavor_spices
        flavor_impressions
      ]
    )
  }
end
