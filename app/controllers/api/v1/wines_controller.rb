# frozen_string_literal: true

class Api::V1::WinesController < ApplicationController
  before_action :set_wine, only: %i[update destroy]

  def create
    wine = WineForm.new(wine_params.merge(tasting_sheet_id_params))
    if wine.save
      render json: serialized(wine.wine_record), status: :created
    else
      render json: wine.errors, status: :unprocessable_entity
    end
  end

  def update
    if @wine.update(wine_params)
      render json: serialized(@wine)
    else
      render json: @wine.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @wine.destroy!
    head :no_content
  end

  private

  def set_wine
    @wine = Wine.find(params[:id])
  end

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
  end

  def tasting_sheet_id_params
    params.permit(:tasting_sheet_id)
  end

  def serialized(records)
    WineResource.new(records).serialize
  end
end
