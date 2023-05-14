# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AppearanceImpression, type: :model do
  let(:appearance_impression) { FactoryBot.build(:appearance_impression) }

  describe 'validation' do
    it 'is valid with color' do
      expect(appearance_impression).to be_valid
    end
  end
end
