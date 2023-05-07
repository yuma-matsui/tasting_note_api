# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate, only: :create

  def index
    render json: current_user.id
  end

  def create
    user = User.new(user_params)
    if user.save
      head :no_content
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.destroy!
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:uid, :email)
  end
end
