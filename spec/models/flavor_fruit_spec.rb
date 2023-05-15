# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FlavorFruit, type: :model do
  let(:flavor_fruit) { FactoryBot.build(:flavor_fruit) }

  it 'is valid with fruit' do
    expect(flavor_fruit).to be_valid
  end
end
