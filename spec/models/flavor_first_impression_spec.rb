# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FlavorFirstImpression, type: :model do
  let(:flavor_first_impression) { FactoryBot.build(:flavor_first_impression) }

  it 'is valid with first_impression' do
    expect(flavor_first_impression).to be_valid
  end
end
