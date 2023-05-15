# frozen_string_literal: true

FactoryBot.define do
  factory :appearance_impression do
    impression { '若々しい' }
    appearance
  end
end
