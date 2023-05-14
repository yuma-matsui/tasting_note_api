# frozen_string_literal: true

FactoryBot.define do
  factory :appearance do
    clarity     { '澄んだ' }
    brightness  { '輝きのある' }
    intensity   { '無色に近い' }
    consistency { 'さらっとした' }
    tasting_sheet
  end
end
