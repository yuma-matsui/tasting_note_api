# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:uid)   { |n| "testUid-#{n}" }
    sequence(:email) { |n| "test-mail-#{n}@example.com" }
  end
end
