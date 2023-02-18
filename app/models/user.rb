# frozen_string_literal: true

class User < ApplicationRecord
  validates :uid, presence: true
  validates :name, presence: true
end
