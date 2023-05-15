# frozen_string_literal: true

FactoryBot.define do
  factory :flavor_impression do
    impression { '若々しい' }
    flavor
  end
end
