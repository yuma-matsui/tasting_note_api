# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::TastingSheets', type: :request do
  include_context 'with current user'
  let(:tasting_sheet) { FactoryBot.attributes_for(:tasting_sheet_form, :without_user) }
  let(:params) do
    {
      tasting_sheet: {
        name: tasting_sheet[:name],
        color: tasting_sheet[:color],
        time: tasting_sheet[:time]
      },
      appearance: tasting_sheet[:appearance],
      flavor: tasting_sheet[:flavor],
      taste: tasting_sheet[:taste],
      conclusion: tasting_sheet[:conclusion]
    }
  end
  let(:result_format) do
    {
      **params[:tasting_sheet],
      appearance: { **params[:appearance] },
      flavor: { **params[:flavor] },
      taste: { **params[:taste] },
      conclusion: { **params[:conclusion] }
    }
  end
  let(:created_tasting_sheet) { current_user.tasting_sheets.create(name: 'test', color: 'red', time: '5') }

  describe 'GET /api/v1/tasting_sheets' do
    it 'returns ok status' do
      get api_v1_tasting_sheets_path
      expect(response).to have_http_status :ok
    end

    it 'returns empty collections' do
      get api_v1_tasting_sheets_path
      expect(JSON.parse(response.body)).to eq([])
    end

    it 'returns current user tasting sheets list' do
      2.times { |n| current_user.tasting_sheets.create(name: "test-#{n}", color: 'red', time: n.to_s) }

      get api_v1_tasting_sheets_path
      expect(JSON.parse(response.body).length).to eq 2
    end
  end

  describe 'POST /api/v1/tasting_sheets' do
    context 'with valid params' do
      it 'returns created status' do
        post api_v1_tasting_sheets_path params: params
        expect(response).to have_http_status :created
      end

      it 'adds current user tasting_sheets' do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change { current_user.tasting_sheets.reload.length }.from(0).to(1)
      end

      it 'creates TastingSheet' do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(TastingSheet, :count).by(1)
      end

      it 'creates Appearance' do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(Appearance, :count).by(1)
      end

      it 'creates 2 AppearanceImpression' do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(AppearanceImpression, :count).by(2)
      end

      it 'creates 2 AppearanceColor' do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(AppearanceColor, :count).by(2)
      end

      it 'creates Flavor' do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(Flavor, :count).by(1)
      end

      it 'creates 2 FlavorFirstImpression' do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(FlavorFirstImpression, :count).by(2)
      end

      it 'creates 2 FlavorFruit' do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(FlavorFruit, :count).by(2)
      end

      it 'creates 2 FlavorFlower' do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(FlavorFlower, :count).by(2)
      end

      it 'creates 2 FlavorSpice' do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(FlavorSpice, :count).by(2)
      end

      it 'creates 2 FlavorImpression' do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(FlavorImpression, :count).by(2)
      end

      it 'creates Taste' do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(Taste, :count).by(1)
      end

      it 'creates Conclusion' do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(Conclusion, :count).by(1)
      end

      it 'returns created tasting_sheet' do
        post api_v1_tasting_sheets_path params: params
        expect(JSON.parse(response.body, symbolize_names: true)).to include result_format
      end
    end

    context 'with invalid params' do
      before do
        params[:tasting_sheet][:name] = ''
      end

      it 'returns unprocessable entity status' do
        post api_v1_tasting_sheets_path params: params
        expect(response).to have_http_status :unprocessable_entity
      end

      it "can't create current user tasting sheet" do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change { current_user.tasting_sheets.reload.length }.by(0)
      end

      it "can't create TastingSheet" do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(TastingSheet, :count).by(0)
      end

      it "can't create Appearance" do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(Appearance, :count).by(0)
      end

      it "can't create AppearanceImpression" do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(AppearanceImpression, :count).by(0)
      end

      it "can't create AppearanceColor" do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(AppearanceColor, :count).by(0)
      end

      it "can't create Flavor" do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(Flavor, :count).by(0)
      end

      it "can't create FlavorFirstImpression" do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(FlavorFirstImpression, :count).by(0)
      end

      it "can't create FlavorFruit" do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(FlavorFruit, :count).by(0)
      end

      it "can't create FlavorFlower" do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(FlavorFlower, :count).by(0)
      end

      it "can't create FlavorSpice" do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(FlavorSpice, :count).by(0)
      end

      it "can't create FlavorImpression" do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(FlavorImpression, :count).by(0)
      end

      it "can't create Taste" do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(Taste, :count).by(0)
      end

      it "can't create Conclusion" do
        expect { post api_v1_tasting_sheets_path params: params }.to \
          change(Conclusion, :count).by(0)
      end
    end
  end

  describe 'GET /api/v1/tasting_sheet' do
    it 'returns ok status' do
      get api_v1_tasting_sheet_path(created_tasting_sheet.id)
      expect(response).to have_http_status :ok
    end

    it 'returns a tasting_sheet' do
      get api_v1_tasting_sheet_path(created_tasting_sheet.id)
      expect(JSON.parse(response.body, symbolize_names: true)).to \
        include({ name: 'test', color: 'red', time: '5' })
    end

    it 'returns nil when tasting_sheet is not found' do
      get api_v1_tasting_sheet_path(0)
      expect(JSON.parse(response.body)).to eq nil
    end
  end

  describe 'PUT /api/v1/tasting_sheet' do
    context 'with valid params' do
      before do
        params[:tasting_sheet][:name] = 'updated-sheet'
      end

      it 'returns no content' do
        put api_v1_tasting_sheet_path(created_tasting_sheet.id), params: params
        expect(response).to have_http_status :no_content
      end

      it 'updates tasting_sheet name' do
        expect { put api_v1_tasting_sheet_path(created_tasting_sheet.id), params: params }.to \
          change { created_tasting_sheet.reload.name }.from('test').to('updated-sheet')
      end

      it 'can update tasting_sheet name even if other attributes are blank' do
        params[:tasting_sheet][:color] = ''
        expect { put api_v1_tasting_sheet_path(created_tasting_sheet.id), params: params }.to \
          change { created_tasting_sheet.reload.name }.from('test').to('updated-sheet')
      end

      it "can't update any attributes except name" do
        params[:tasting_sheet][:time] = '10'
        put api_v1_tasting_sheet_path(created_tasting_sheet.id), params: params
        expect(created_tasting_sheet.time).to eq '5'
      end
    end

    context 'with invalid params' do
      before do
        params[:tasting_sheet][:name] = ''
      end

      it 'returns unprocessable entity' do
        put api_v1_tasting_sheet_path(created_tasting_sheet.id), params: params
        expect(response).to have_http_status :unprocessable_entity
      end

      it "can't update tasting_sheet name" do
        put api_v1_tasting_sheet_path(created_tasting_sheet.id), params: params
        expect(created_tasting_sheet.reload.name).to eq 'test'
      end
    end
  end

  describe 'DELETE /api/v1/tasting_sheet' do
    let(:current_user_sheet) { current_user.tasting_sheets.last }

    before do
      FactoryBot.build(:tasting_sheet_form, :without_user, user_id: current_user.id).save
      FactoryBot.create(:wine).tasting_sheet = current_user_sheet
    end

    context 'with valid id' do
      it 'returns no content' do
        delete api_v1_tasting_sheet_path(current_user_sheet.id)
        expect(response).to have_http_status :no_content
      end

      it 'destroys TastingSheet' do
        expect { delete api_v1_tasting_sheet_path(current_user_sheet.id) }.to \
          change(TastingSheet, :count).by(-1)
      end

      it 'destroys Appearance' do
        expect { delete api_v1_tasting_sheet_path(current_user_sheet.id) }.to \
          change(Appearance, :count).by(-1)
      end

      it 'destroys 2 AppearanceImpression' do
        expect { delete api_v1_tasting_sheet_path(current_user_sheet.id) }.to \
          change(AppearanceImpression, :count).by(-2)
      end

      it 'destroys 2 AppearanceColor' do
        expect { delete api_v1_tasting_sheet_path(current_user_sheet.id) }.to \
          change(AppearanceColor, :count).by(-2)
      end

      it 'destroys Flavor' do
        expect { delete api_v1_tasting_sheet_path(current_user_sheet.id) }.to \
          change(Flavor, :count).by(-1)
      end

      it 'destroys 2 FlavorFirstImpression' do
        expect { delete api_v1_tasting_sheet_path(current_user_sheet.id) }.to \
          change(FlavorFirstImpression, :count).by(-2)
      end

      it 'destroys 2 FlavorFruit' do
        expect { delete api_v1_tasting_sheet_path(current_user_sheet.id) }.to \
          change(FlavorFruit, :count).by(-2)
      end

      it 'destroys 2 FlavorFlower' do
        expect { delete api_v1_tasting_sheet_path(current_user_sheet.id) }.to \
          change(FlavorFlower, :count).by(-2)
      end

      it 'destroys 2 FlavorSpice' do
        expect { delete api_v1_tasting_sheet_path(current_user_sheet.id) }.to \
          change(FlavorSpice, :count).by(-2)
      end

      it 'destroys 2 FlavorImpression' do
        expect { delete api_v1_tasting_sheet_path(current_user_sheet.id) }.to \
          change(FlavorImpression, :count).by(-2)
      end

      it 'destroys Taste' do
        expect { delete api_v1_tasting_sheet_path(current_user_sheet.id) }.to \
          change(Taste, :count).by(-1)
      end

      it 'destroys Conclusion' do
        expect { delete api_v1_tasting_sheet_path(current_user_sheet.id) }.to \
          change(Conclusion, :count).by(-1)
      end

      it 'destorys Wine' do
        expect { delete api_v1_tasting_sheet_path(current_user_sheet.id) }.to \
          change(Wine, :count).by(-1)
      end
    end

    context 'with invalid id' do
      it 'raises NoMethodError' do
        expect { delete api_v1_tasting_sheet_path(0) }.to \
          raise_error NoMethodError
      end
    end
  end
end
