# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate
  attr_reader :current_user

  private

  def authenticate
    authenticate_with_http_token { |token| find_current_user(FirebaseAuth::Token.payload(token)) }
  end

  def find_current_user(payload)
    @current_user = User.find_or_create_by!(uid: payload['sub'], name: payload['name'])
  end
end
