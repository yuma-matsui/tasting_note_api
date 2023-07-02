# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API::V1::Images', type: :request do
  include_context 'with current user'
  let(:filename) { 'filename' }

  before do
    allow(Image).to \
      receive(:signed_url).with(filename, :put_object).and_return("https://example.com/#{filename}")
  end

  describe 'POST /api/v1/images' do
    context 'with valid params' do
      it 'returns ok status' do
        post api_v1_images_path params: { filename: filename }
        expect(response).to have_http_status :ok
      end

      it 'returns url with filename path' do
        post api_v1_images_path params: { filename: filename }
        expect(response.body).to eq "https://example.com/#{filename}"
      end
    end

    context 'with invalid params' do
      it 'raise Error' do
        expect { post api_v1_images_path params: { filename: nil } }.to \
          raise_error RSpec::Mocks::MockExpectationError
      end
    end
  end
end
