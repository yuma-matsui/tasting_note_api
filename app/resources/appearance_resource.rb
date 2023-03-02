# frozen_string_literal: true

class AppearanceResource < ApplicationResource
  attributes :clarity, :brightness, :intensity, :consistency,
             :appearance_colors, :appearance_impressions

  attribute :appearance_colors do |resource|
    resource.appearance_colors.map(&:color)
  end

  attribute :appearance_impressions do |resource|
    resource.appearance_impressions.map(&:impression)
  end
end
