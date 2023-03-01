# frozen_string_literal: true

class TastingSheetResource < ApplicationResource
  attributes :id, :name, :color, :time

  one :appearance, resource: AppearanceResource
  one :flavor,     resource: FlavorResource
  one :taste,      resource: TasteResource
  one :conclusion, resource: ConclusionResource
end
