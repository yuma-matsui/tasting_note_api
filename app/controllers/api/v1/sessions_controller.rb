# frozen_string_literal: true

class Api::V1::SessionsController < ApplicationController
  def index
    render json: current_user.id
  end
end
