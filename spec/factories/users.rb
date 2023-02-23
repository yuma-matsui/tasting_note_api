# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:uid) { |n| "testUid-#{n}" }
    name           { 'tasting-sheet-user' }
  end
end
