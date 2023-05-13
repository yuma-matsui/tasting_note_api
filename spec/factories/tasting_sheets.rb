# frozen_string_literal: true

FactoryBot.define do
  factory :tasting_sheet do
    name  { 'test-sheet' }
    color { 'red' }
    time  { '5' }
    user
    wine
  end
end
