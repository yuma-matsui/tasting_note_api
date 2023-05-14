# frozen_string_literal: true

FactoryBot.define do
  factory :appearance do
    clarity     { '澄んだ' }
    brightness  { '輝きのある' }
    intensity   { '無色に近い' }
    consistency { 'さらっとした' }
    tasting_sheet

    trait :with_appearance_color do
      after(:create) { |appearance| create_list(:appearance_color, 1, appearance: appearance) }
    end

    trait :with_appearance_impression do
      after(:create) { |appearance| create_list(:appearance_impression, 1, appearance: appearance) }
    end
  end
end
