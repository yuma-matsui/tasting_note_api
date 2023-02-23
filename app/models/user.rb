# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tasting_sheets, dependent: :destroy

  validates :uid,  presence: true, uniqueness: { scope: :name }
  validates :name, presence: true
end
