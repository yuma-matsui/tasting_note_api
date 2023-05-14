# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appearance, type: :model do
  describe 'validation' do
    appearance = FactoryBot.build(:appearance)
    it 'is valid with clarity, brightness, intensity, consistency' do
      expect(appearance).to be_valid
    end
  end

  describe 'dependent destroy' do
    it 'destroys appearance_color when appearance is destroyed' do
      appearance = FactoryBot.create(:appearance, :with_appearance_color)
      expect { appearance.destroy }.to \
        change(AppearanceColor, :count).by(-1)
    end

    it 'destroys appearance_impression when appearance is destroyed' do
      appearance = FactoryBot.create(:appearance, :with_appearance_impression)
      expect { appearance.destroy }.to \
        change(AppearanceImpression, :count).by(-1)
    end
  end
end
