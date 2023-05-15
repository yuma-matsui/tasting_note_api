# frozen_string_literal: true

FactoryBot.define do
  factory :flavor do
    tasting_sheet

    trait :with_flavor_first_impression do
      after(:create) { |flavor| create_list(:flavor_first_impression, 1, flavor: flavor) }
    end

    trait :with_flavor_fruit do
      after(:create) { |flavor| create_list(:flavor_fruit, 1, flavor: flavor) }
    end

    trait :with_flavor_flower do
      after(:create) { |flavor| create_list(:flavor_flower, 1, flavor: flavor) }
    end

    trait :with_flavor_spice do
      after(:create) { |flavor| create_list(:flavor_spice, 1, flavor: flavor) }
    end

    trait :with_flavor_impression do
      after(:create) { |flavor| create_list(:flavor_impression, 1, flavor: flavor) }
    end
  end
end
