# frozen_string_literal: true

class API::V1::HealthCheckController < ApplicationController
  skip_before_action :authenticate

  def index
    head :ok
  end
end
