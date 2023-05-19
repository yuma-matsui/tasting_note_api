# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Wines', type: :request do
  include_context 'with current user'
  let(:tasting_sheet) { FactoryBot.create(:tasting_sheet, :without_wine) }
  let(:wine) { FactoryBot.attributes_for(:wine) }
  let(:wine_params) { { wine: wine, tasting_sheet_id: tasting_sheet.id } }

  describe 'POST /api/v1/wines' do
    context 'with valid params' do
      it 'returns ok status' do
        post api_v1_wines_path params: wine_params
        expect(response).to have_http_status :created
      end

      it 'creates Wine' do
        expect { post api_v1_wines_path params: wine_params }.to \
          change(Wine, :count).by(1)
      end

      it "updates tasting_sheet's wine_id" do
        aggregate_failures do
          expect(tasting_sheet.wine_id).to eq nil
          post api_v1_wines_path params: wine_params
          expect(tasting_sheet.reload.wine_id).not_to eq nil
        end
      end

      it 'returns wine record' do
        post api_v1_wines_path params: wine_params
        expect(JSON.parse(response.body, symbolize_names: true)).to \
          include wine_params[:wine]
      end
    end

    context 'with invalid params' do
      before do
        wine_params[:wine][:name] = ''
      end

      it 'returns unprocessable entity' do
        post api_v1_wines_path params: wine_params
        expect(response).to have_http_status :unprocessable_entity
      end

      it "doens't create Wine" do
        expect { post api_v1_wines_path params: wine_params }.to \
          change(Wine, :count).by(0)
      end

      it "doesn't update tasting_sheet's wine_id" do
        aggregate_failures do
          expect(tasting_sheet.wine_id).to eq nil
          post api_v1_wines_path params: wine_params
          expect(tasting_sheet.reload.wine_id).to eq nil
        end
      end
    end
  end

  describe 'PUT /api/v1/wine' do
    let(:created_wine) { FactoryBot.create(:wine, :with_tasting_sheet) }

    before do
      wine_params[:tasting_sheet_id] = created_wine.tasting_sheet.id
    end

    context 'with valid params' do
      before do
        wine_params[:wine][:name] = 'updated-wine'
      end

      it 'returns ok status' do
        put api_v1_wine_path(created_wine.id), params: wine_params
        expect(response).to have_http_status :ok
      end

      it 'updates wine name' do
        aggregate_failures do
          expect(created_wine.name).to eq('test-wine')
          put api_v1_wine_path(created_wine), params: wine_params
          expect(created_wine.reload.name).to eq 'updated-wine'
        end
      end
    end

    context 'with invalid params' do
      before do
        wine_params[:wine][:name] = ''
      end

      it 'returns unprocessable entity' do
        put api_v1_wine_path(created_wine), params: wine_params
        expect(response).to have_http_status :unprocessable_entity
      end

      it "doesn't update wine name" do
        aggregate_failures do
          expect(created_wine.name).to eq 'test-wine'
          put api_v1_wine_path(created_wine), params: wine_params
          expect(created_wine.reload.name).to eq 'test-wine'
        end
      end
    end
  end

  describe 'DELETE /api/v1/wine' do
    let!(:created_wine) { FactoryBot.create(:wine, :with_tasting_sheet) }

    it 'returns no content' do
      delete api_v1_wine_path(created_wine.id)
      expect(response).to have_http_status :no_content
    end

    it 'destroys Wine' do
      expect { delete api_v1_wine_path(created_wine.id) }.to \
        change(Wine, :count).by(-1)
    end

    it "updates tasting_sheet's wine_id to nil" do
      aggregate_failures do
        expect(created_wine.tasting_sheet.wine_id).not_to eq nil
        delete api_v1_wine_path(created_wine.id)
        expect(created_wine.tasting_sheet.reload.wine_id).to eq nil
      end
    end
  end
end
