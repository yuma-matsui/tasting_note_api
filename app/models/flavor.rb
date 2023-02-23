# frozen_string_literal: true

class Flavor < ApplicationRecord
  belongs_to :tasting_sheet
  has_many :flavor_first_impressions, dependent: :destroy
  has_many :flavor_fruits,            dependent: :destroy
  has_many :flavor_flowers,           dependent: :destroy
  has_many :flavor_spices,            dependent: :destroy
  has_many :flavor_impressions,       dependent: :destroy
end
