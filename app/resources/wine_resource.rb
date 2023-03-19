# frozen_string_literal: true

class WineResource < ApplicationResource
  attributes :name, :vintage, :country, :region,
             :grape, :alcohol_percentage, :memo

  attribute :tasting_sheet_id do |resource|
    resource.tasting_sheet.id
  end
end
