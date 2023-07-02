# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API::V1::Users', type: :request do
  include_context 'with current user'

  describe 'GET /api/v1/users' do
    it 'returns 200 response' do
      get api_v1_users_path
      expect(response).to have_http_status :ok
    end

    it 'returns current_user id' do
      get api_v1_users_path
      expect(JSON.parse(response.body)).to eq(current_user.id)
    end
  end

  describe 'POST /api/v1/users' do
    let(:user_params) { FactoryBot.attributes_for(:user) }

    context 'with valid params' do
      it 'returns no content' do
        post api_v1_users_path params: { user: user_params }
        expect(response).to have_http_status :no_content
      end

      it 'creates User' do
        expect { post api_v1_users_path params: { user: user_params } }.to \
          change(User, :count).by(1)
      end
    end

    context 'with invalid params' do
      before do
        user_params[:uid] = ''
      end

      it 'returns unprocessable_entity' do
        post api_v1_users_path params: { user: user_params }
        expect(response).to have_http_status :unprocessable_entity
      end

      it "can't create User" do
        expect { post api_v1_users_path params: { user: user_params } }.to \
          change(User, :count).by(0)
      end
    end
  end

  describe 'DELETE /api/v1/users' do
    it 'returns no content' do
      delete api_v1_user_path(current_user.id)
      expect(response).to have_http_status :no_content
    end

    it 'destroys User' do
      expect { delete api_v1_user_path(current_user.id) }.to \
        change(User, :count).by(-1)
    end
  end
end
