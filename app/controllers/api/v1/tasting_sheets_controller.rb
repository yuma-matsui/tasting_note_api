# frozen_string_literal: true

class Api::V1::TastingSheetsController < ApplicationController
  before_action :set_tasting_sheet, only: %i[show destroy update]

  def index
    render json: current_user_tasting_sheets
  end

  def create
    tasting_sheet = TastingSheetForm.new(tasting_sheet_params)
    if tasting_sheet.save
      render json: serialized(current_user.tasting_sheets.latest_one), status: :created
    else
      render json: tasting_sheet.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @tasting_sheet ? serialized(@tasting_sheet) : nil
  end

  def update
    if @tasting_sheet.update(name: tasting_sheet_params[:name])
      render json: serialized(@tasting_sheet)
    else
      render json: tasting_sheet.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tasting_sheet.destroy!
    head :no_content
  end

  private

  def set_tasting_sheet
    @tasting_sheet = current_user.tasting_sheets.find_by(id: params[:id])
  end

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

  def current_user_tasting_sheets
    serialized(current_user.tasting_sheets.default)
  end
end
