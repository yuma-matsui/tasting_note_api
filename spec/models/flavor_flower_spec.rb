# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FlavorFlower, type: :model do
  let(:flavor_flower) { FactoryBot.build(:flavor_flower) }

  it 'is valid with flower' do
    expect(flavor_flower).to be_valid
  end
end
