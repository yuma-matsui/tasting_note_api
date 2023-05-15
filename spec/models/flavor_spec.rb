# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Flavor, type: :model do
  describe 'dependent destroy' do
    it 'destroys flavor_first_impression when flavor is destroyed' do
      flavor = FactoryBot.create(:flavor, :with_flavor_first_impression)
      expect { flavor.destroy }.to \
        change(FlavorFirstImpression, :count).by(-1)
    end

    it 'destroys flavor_fruit when flavor is destroyed' do
      flavor = FactoryBot.create(:flavor, :with_flavor_fruit)
      expect { flavor.destroy }.to \
        change(FlavorFruit, :count).by(-1)
    end

    it 'destroys flavor_flower when flavor is destroyed' do
      flavor = FactoryBot.create(:flavor, :with_flavor_flower)
      expect { flavor.destroy }.to \
        change(FlavorFlower, :count).by(-1)
    end

    it 'destroys flavor_spice when flavor is destroyed' do
      flavor = FactoryBot.create(:flavor, :with_flavor_spice)
      expect { flavor.destroy }.to \
        change(FlavorSpice, :count).by(-1)
    end

    it 'destroys flavor_impression when flavor is destroyed' do
      flavor = FactoryBot.create(:flavor, :with_flavor_impression)
      expect { flavor.destroy }.to \
        change(FlavorImpression, :count).by(-1)
    end
  end
end
