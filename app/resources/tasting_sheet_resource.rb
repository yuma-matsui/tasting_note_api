# frozen_string_literal: true

class TastingSheetResource < ApplicationResource
  attributes :id, :name, :color, :time

  attribute :created_at do |resource|
    I18n.l resource.created_at, format: :short
  end

  one :appearance, resource: AppearanceResource
  one :flavor,     resource: FlavorResource
  one :taste,      resource: TasteResource
  one :conclusion, resource: ConclusionResource
end
