# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AppearanceColor, type: :model do
  let(:appearance_color) { FactoryBot.build(:appearance_color) }

  describe 'validation' do
    it 'is valid with color' do
      expect(appearance_color).to be_valid
    end
  end
end
