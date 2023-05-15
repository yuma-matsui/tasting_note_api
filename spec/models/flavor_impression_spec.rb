# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FlavorImpression, type: :model do
  let(:flavor_impression) { FactoryBot.build(:flavor_impression) }

  it 'is valid with impression' do
    expect(flavor_impression).to be_valid
  end
end
