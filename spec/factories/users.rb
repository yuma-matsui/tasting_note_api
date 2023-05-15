# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:uid)   { |n| "test-uid-#{n}" }
    sequence(:email) { |n| "test-mail-#{n}@example.com" }

    trait :with_tasting_sheet do
      after(:create) { |user| create_list(:tasting_sheet, 1, user: user) }
    end
  end
end
