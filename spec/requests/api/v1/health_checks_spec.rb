# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::HealthChecks', type: :request do
  describe 'GET /api/v1/health_checks' do
    it 'returns ok status' do
      get api_v1_health_check_index_path
      expect(response).to have_http_status :ok
    end
  end
end
