# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  describe 'validation' do
    describe 'email' do
      example 'valid' do
        expect(user).to be_valid
      end

      example 'invalid with blank' do
        user.email = ''
        expect(user).to be_invalid
      end

      example 'invalid with existing email' do
        user.save
        other_user = FactoryBot.build(:user)
        other_user.email = user.email
        expect(other_user).to be_invalid
      end
    end

    describe 'uid' do
      example 'valid' do
        expect(user).to be_valid
      end

      example 'invalid with blank uid' do
        user.uid = ''
        expect(user).to be_invalid
      end
    end
  end
end
