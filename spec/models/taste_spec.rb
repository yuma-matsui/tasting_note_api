# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Taste, type: :model do
  let(:taste) { FactoryBot.build(:taste) }

  it 'is valid with attack, acidity, sweetness, balance, alcohol, after_taste, astringent, bitterness' do
    expect(taste).to be_valid
  end

  it 'is valid without bitterness' do
    taste.bitterness = ''
    expect(taste).to be_valid
  end

  it 'is valid without astringent' do
    taste.astringent = ''
    expect(taste).to be_valid
  end
end
