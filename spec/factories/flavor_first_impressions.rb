# frozen_string_literal: true

FactoryBot.define do
  factory :flavor_first_impression do
    first_impression { '閉じている' }
    flavor
  end
end
