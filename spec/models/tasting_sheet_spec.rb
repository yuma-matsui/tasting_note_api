# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TastingSheet, type: :model do
  let(:tasting_sheet) { FactoryBot.build(:tasting_sheet) }

  it 'is valid with name, color, time' do
    expect(tasting_sheet).to be_valid
  end

  describe 'dependent destroy' do
    it 'destroys appearance when tasting_sheet is destroyed' do
      tasting_sheet = FactoryBot.create(:tasting_sheet, :with_appearance)
      expect { tasting_sheet.destroy }.to \
        change(Appearance, :count).by(-1)
    end

    it 'destroys flavor when tasting_sheet is destroyed' do
      tasting_sheet = FactoryBot.create(:tasting_sheet, :with_flavor)
      expect { tasting_sheet.destroy }.to \
        change(Flavor, :count).by(-1)
    end

    it 'destroys taste when tasting_sheet is destroyed' do
      tasting_sheet = FactoryBot.create(:tasting_sheet, :with_taste)
      expect { tasting_sheet.destroy }.to \
        change(Taste, :count).by(-1)
    end

    it 'destroys conclusion when tasting_sheet is destroyed' do
      tasting_sheet = FactoryBot.create(:tasting_sheet, :with_conclusion)
      expect { tasting_sheet.destroy }.to \
        change(Conclusion, :count).by(-1)
    end
  end

  describe 'call back' do
    it 'destroys wine when tasting_sheet is destroyed' do
      tasting_sheet = FactoryBot.create(:tasting_sheet, :with_wine)
      expect { tasting_sheet.destroy }.to \
        change(Wine, :count).by(-1)
    end
  end

  describe 'scope' do
    let!(:a_week_ago_sheet) { FactoryBot.create(:tasting_sheet, created_at: 1.week.ago) }
    let!(:latest_sheet) { FactoryBot.create(:tasting_sheet) }

    it 'returns sorted collection by created date' do
      expect(described_class.latest_order).to \
        eq([latest_sheet, a_week_ago_sheet])
    end

    it 'returns the latest sheet' do
      expect(described_class.latest_one).to eq(latest_sheet)
    end
  end
end
