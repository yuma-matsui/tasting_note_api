# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Conclusion, type: :model do
  let(:conclusion) { FactoryBot.build(:conclusion) }

  it 'is valid with evaluation, optimum_temperature, decantage, glass, vingate, country, grape' do
    expect(conclusion).to be_valid
  end

  it 'is valid without decantage' do
    conclusion.decantage = ''
    expect(conclusion).to be_valid
  end
end
