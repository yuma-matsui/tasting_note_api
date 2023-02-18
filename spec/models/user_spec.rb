# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  describe 'validation' do
    describe 'name' do
      example 'valid' do
        expect(user).to be_valid
      end

      example 'invalid' do
        user.name = ''
        expect(user).to be_invalid
      end
    end

    describe 'uid' do
      example 'valid' do
        expect(user).to be_valid
      end

      example 'invalid' do
        user.uid = ''
        expect(user).to be_invalid
      end
    end
  end
end