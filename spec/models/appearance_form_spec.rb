# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AppearanceForm, type: :model do
  let(:appearance_form) { FactoryBot.build(:appearance_form) }

  describe 'validation' do
    context 'with valid attributes' do
      example 'with clarity, intensity, appearance_colors, brightness, consistency, appearance_impressions tasting_sheet_id' do
        expect(appearance_form).to be_valid
      end
    end

    context 'with invalid attributes' do
      example 'when appearance_colors size is less than 2' do
        appearance_form.appearance_colors.pop
        expect(appearance_form).to be_invalid
      end

      example 'when appearance_impressions size is less than 2' do
        appearance_form.appearance_impressions.pop
        expect(appearance_form).to be_invalid
      end

      example 'when appearance_colors size is more than 2' do
        appearance_form.appearance_colors.push('test')
        expect(appearance_form).to be_invalid
      end

      example 'when appearance_impressions size is more than 2' do
        appearance_form.appearance_impressions.push('test')
        expect(appearance_form).to be_invalid
      end
    end
  end

  describe 'save' do
    it 'creates Appearance' do
      expect { appearance_form.save }.to \
        change(Appearance, :count).by(1)
    end

    it 'creates 2 AppearanceColors' do
      expect { appearance_form.save }.to \
        change(AppearanceColor, :count).by(2)
    end

    it 'creates 2 AppearanceImpressions' do
      expect { appearance_form.save }.to \
        change(AppearanceImpression, :count).by(2)
    end
  end
end
