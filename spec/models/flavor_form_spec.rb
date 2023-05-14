# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FlavorForm, type: :model do
  let(:flavor_form) { FactoryBot.build(:flavor_form) }

  describe 'validation' do
    context 'with valid attributes' do
      it 'is valid with flavor_first_impressions, flavor_fruits, flavor_flowers, flavor_spices, flavor_impressions' do
        expect(flavor_form).to be_valid
      end
    end

    context 'with invalid attributes' do
      example 'when flavor_first_impressions size is less than 2' do
        flavor_form.flavor_first_impressions.pop
        expect(flavor_form).to be_invalid
      end

      example 'when flavor_fruits size is less than 2' do
        flavor_form.flavor_fruits.pop
        expect(flavor_form).to be_invalid
      end

      example 'when flavor_flowers size is less than 2' do
        flavor_form.flavor_flowers.pop
        expect(flavor_form).to be_invalid
      end

      example 'when flavor_spices size is less than 2' do
        flavor_form.flavor_spices.pop
        expect(flavor_form).to be_invalid
      end

      example 'when flavor_impressions size is less than 2' do
        flavor_form.flavor_impressions.pop
        expect(flavor_form).to be_invalid
      end

      example 'when flavor_first_impressions size is more than 2' do
        flavor_form.flavor_first_impressions.push('test')
        expect(flavor_form).to be_invalid
      end

      example 'when flavor_fruits size is more than 2' do
        flavor_form.flavor_fruits.push('test')
        expect(flavor_form).to be_invalid
      end

      example 'when flavor_flowers size is more than 2' do
        flavor_form.flavor_flowers.push('test')
        expect(flavor_form).to be_invalid
      end

      example 'when flavor_spices size is more than 2' do
        flavor_form.flavor_spices.push('test')
        expect(flavor_form).to be_invalid
      end

      example 'when flavor_impressions size is more than 2' do
        flavor_form.flavor_impressions.push('test')
        expect(flavor_form).to be_invalid
      end
    end
  end

  describe 'save' do
    it 'creates Flavor' do
      expect { flavor_form.save }.to \
        change(Flavor, :count).by(1)
    end

    it 'creates 2 FlavorFirstImpressions' do
      expect { flavor_form.save }.to \
        change(FlavorFirstImpression, :count).by(2)
    end

    it 'creates 2 FlavorFruits' do
      expect { flavor_form.save }.to \
        change(FlavorFruit, :count).by(2)
    end

    it 'creates 2 FlavorFlowers' do
      expect { flavor_form.save }.to \
        change(FlavorFlower, :count).by(2)
    end

    it 'creates 2 FlavorSpices' do
      expect { flavor_form.save }.to \
        change(FlavorSpice, :count).by(2)
    end

    it 'creates 2 FlavorImpressions' do
      expect { flavor_form.save }.to \
        change(FlavorImpression, :count).by(2)
    end
  end
end
