# frozen_string_literal: true

class API::V1::ImagesController < ApplicationController
  def create
    render json: Image.signed_url(filename, :put_object)
  end

  private

  def filename
    params.permit(:filename)[:filename]
  end
end
