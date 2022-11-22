# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::HelloController, type: :controller do
  describe '#index' do
    it 'respondes successfully' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'hello' do
    it 'respondes successfully' do
      hello = 'hello'
      expect(hello).to eq 'good bye'
    end
  end
end
