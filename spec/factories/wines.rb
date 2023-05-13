# frozen_string_literal: true

FactoryBot.define do
  factory :wine do
    name               { 'test-wine' }
    vintage            { '1930' }
    country            { '日本' }
    region             { '山梨' }
    grape              { 'ナイアガラ' }
    alcohol_percentage { '12' }
    memo               { 'test-memo' }
    sequence(:image)   { |n| "https://example.com/images/#{n}" }
  end
end
