# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tasting_sheets, dependent: :destroy

  validates :uid, presence: true, uniqueness: { scope: :email }
  validates :email, presence: true, uniqueness: true
end
