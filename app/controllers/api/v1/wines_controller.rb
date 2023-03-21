# frozen_string_literal: true

class Api::V1::WinesController < ApplicationController
  def create
    wine = WineForm.new(wine_params)
    if wine.save
      render json: serialized(wine.wine_record), status: :created
    else
      render json: wine.errors, status: :unprocessable_entity
    end
  end

  private

  def wine_params
    params
      .require(:wine)
      .permit(
        :name,
        :vintage,
        :country,
        :region,
        :grape,
        :alcohol_percentage,
        :memo
      )
      .merge(tasting_sheet_id_params)
  end

  def tasting_sheet_id_params
    params.permit(:tasting_sheet_id)
  end

  def serialized(records)
    WineResource.new(records).serialize
  end
end
