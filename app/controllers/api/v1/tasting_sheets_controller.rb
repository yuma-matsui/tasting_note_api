# frozen_string_literal: true

class Api::V1::TastingSheetsController < ApplicationController
  def index
    render json: serialized(current_user.tasting_sheets.default)
  end

  def create
    tasting_sheet = TastingSheetForm.new(tasting_sheet_params)
    if tasting_sheet.save
      render json: serialized(current_user.tasting_sheets.latest_one), status: :created
    else
      render json: tasting_sheet.errors, status: :unprocessable_entity
    end
  end

  private

  def tasting_sheet_params
    params
      .require(:tasting_sheet)
      .permit(:name, :color, :time)
      .merge(
        appearance: appearance_params,
        flavor: flavor_params,
        taste: taste_params,
        conclusion: conclusion_params,
        user_id: current_user.id
      )
  end

  def appearance_params
    params
      .require(:appearance)
      .permit(
        :clarity,
        :brightness,
        :intensity,
        :consistency,
        appearance_colors: [],
        appearance_impressions: []
      )
  end

  def flavor_params
    params
      .require(:flavor)
      .permit(
        flavor_first_impressions: [],
        flavor_fruits: [],
        flavor_flowers: [],
        flavor_spices: [],
        flavor_impressions: []
      )
  end

  def taste_params
    params
      .require(:taste)
      .permit(
        :attack,
        :sweetness,
        :acidity,
        :bitterness,
        :astringent,
        :balance,
        :alcohol,
        :after_taste
      )
  end

  def conclusion_params
    params
      .require(:conclusion)
      .permit(
        :evaluation,
        :optimum_temperature,
        :decantage,
        :glass,
        :vintage,
        :country,
        :grape
      )
  end

  def serialized(records)
    TastingSheetResource.new(records).serialize
  end
end
