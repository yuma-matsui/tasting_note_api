# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AppearanceImpression, type: :model do
  let(:appearance_impression) { FactoryBot.build(:appearance_impression) }

  it 'is valid with impression' do
    expect(appearance_impression).to be_valid
  end
end
