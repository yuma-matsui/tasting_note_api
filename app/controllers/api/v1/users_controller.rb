# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  def destroy
    current_user.destroy!
    head :no_content
  end
end
