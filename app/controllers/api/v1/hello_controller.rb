# frozen_string_literal: true

class Api::V1::HelloController < ApplicationController
  def index
    render json: 'Hello Tasting Note'
  end
end
