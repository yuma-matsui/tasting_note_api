# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API::V1::HealthCheck', type: :request do
  describe 'GET /api/v1/health_check' do
    it 'returns ok status' do
      get api_v1_health_check_index_path
      expect(response).to have_http_status :ok
    end
  end
end
