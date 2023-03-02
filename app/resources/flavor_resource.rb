# frozen_string_literal: true

class FlavorResource < ApplicationResource
  attributes :flavor_first_impressions, :flavor_fruits,
             :flavor_flowers, :flavor_spices, :flavor_impressions

  attribute :flavor_first_impressions do |resource|
    resource.flavor_first_impressions.map(&:first_impression)
  end

  attribute :flavor_fruits do |resource|
    resource.flavor_fruits.map(&:fruit)
  end

  attribute :flavor_flowers do |resource|
    resource.flavor_flowers.map(&:flower)
  end

  attribute :flavor_spices do |resource|
    resource.flavor_spices.map(&:spice)
  end

  attribute :flavor_impressions do |resource|
    resource.flavor_impressions.map(&:impression)
  end
end
