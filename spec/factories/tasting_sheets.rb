# frozen_string_literal: true

FactoryBot.define do
  factory :tasting_sheet do
    name  { 'test-sheet' }
    color { 'red' }
    time  { '5' }
    user
    wine

    trait :with_wine do
      after(:create) { |tasting_sheet| create_list(:wine, 1, tasting_sheet: tasting_sheet) }
    end

    trait :with_appearance do
      after(:create) { |tasting_sheet| create_list(:appearance, 1, tasting_sheet: tasting_sheet) }
    end

    trait :with_flavor do
      after(:create) { |tasting_sheet| create_list(:flavor, 1, tasting_sheet: tasting_sheet) }
    end

    trait :with_taste do
      after(:create) { |tasting_sheet| create_list(:taste, 1, tasting_sheet: tasting_sheet) }
    end

    trait :with_conclusion do
      after(:create) { |tasting_sheet| create_list(:conclusion, 1, tasting_sheet: tasting_sheet) }
    end
  end
end
