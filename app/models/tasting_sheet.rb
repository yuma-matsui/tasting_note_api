# frozen_string_literal: true

class TastingSheet < ApplicationRecord
  belongs_to :user
  has_one :appearance, dependent: :destroy

  validates :name,  presence: true
  validates :color, presence: true
  validates :time,  presence: true
end