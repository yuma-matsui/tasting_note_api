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
end
