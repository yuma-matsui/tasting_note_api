# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appearance, type: :model do
  let(:appearance) { FactoryBot.build(:appearance) }

  describe 'validation' do
    it 'is valid with clarity, brightness, intensity, consistency' do
      expect(appearance).to be_valid
    end
  end

  describe 'dependent destroy' do
    it 'is destroyed when tasting sheet is destroyed' do
      appearance.save
      expect { appearance.tasting_sheet.destroy }.to \
        change(described_class, :count).by(-1)
    end
  end
end
