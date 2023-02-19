# frozen_string_literal: true

class User < ApplicationRecord
  validates :uid, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
