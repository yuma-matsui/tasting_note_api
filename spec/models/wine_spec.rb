# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Wine, type: :model do
  let(:wine) { FactoryBot.build(:wine) }

  describe 'validation' do
    it 'is valid with name, vintage, country, region, grape alcohol_percentage, memo, image' do
      expect(wine).to be_valid
    end

    it 'is valid without region' do
      wine.region = ''
      expect(wine).to be_valid
    end

    it 'is valid without memo' do
      wine.memo = ''
      expect(wine).to be_valid
    end

    it 'is valid without image' do
      wine.image = ''
      expect(wine).to be_valid
    end
  end

  describe 'dependent destroy' do
    it "changes tasting_sheet's wine_id to nil when wine is destroyed" do
      wine = FactoryBot.create(:wine, :with_tasting_sheet)
      expect { wine.destroy }.to \
        change { wine.tasting_sheet.wine_id }.from(wine.id).to(nil)
    end
  end

  describe 'save_and_update_sheet' do
    let(:tasting_sheet) { FactoryBot.create(:tasting_sheet, :without_wine) }

    it 'saves wine' do
      expect { wine.save_and_update_sheet(tasting_sheet.id) }.to \
        change(described_class, :count).by(1)
    end

    it "updates tasting_sheet's wine_id" do
      wine.save_and_update_sheet(tasting_sheet.id)
      expect(TastingSheet.all.last.wine_id).to eq(wine.id)
    end
  end
end
