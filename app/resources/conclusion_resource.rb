# frozen_string_literal: true

class ConclusionResource < ApplicationResource
  attributes :evaluation, :optimum_temperature, :glass,
             :decantage, :vintage, :country, :grape
end
