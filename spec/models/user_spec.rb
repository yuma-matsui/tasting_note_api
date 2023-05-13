# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }
  let(:other_user) { FactoryBot.build(:user) }

  it 'is valid with uid and email' do
    expect(user).to be_valid
  end

  it 'is invalid without unique email ' do
    user.save
    other_user.email = user.email
    expect(other_user).to be_invalid
  end
end
