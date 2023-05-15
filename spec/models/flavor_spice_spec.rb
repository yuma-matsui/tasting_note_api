# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FlavorSpice, type: :model do
  let(:flavor_spice) { FactoryBot.build(:flavor_spice) }

  it 'is valid with spice' do
    expect(flavor_spice).to be_valid
  end
end
