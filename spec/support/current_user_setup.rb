# frozen_string_literal: true

RSpec.shared_context 'with current user' do
  let(:current_user) { FactoryBot.create(:user) }

  before do
    allow_any_instance_of(ApplicationController).to \
      receive(:current_user).and_return(current_user)
  end
end
