# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TastingSheetForm, type: :model do
  let(:tasting_sheet_form) { FactoryBot.build(:tasting_sheet_form) }

  describe 'save' do
    context 'with valid params' do
      it 'saves TastingSheet' do
        expect { tasting_sheet_form.save }.to \
          change(TastingSheet, :count).by(1)
      end

      it 'saves Appearance' do
        expect { tasting_sheet_form.save }.to \
          change(Appearance, :count).by(1)
      end

      it 'saves 2 AppearanceImpressions' do
        expect { tasting_sheet_form.save }.to \
          change(AppearanceImpression, :count).by(2)
      end

      it 'saves 2 AppearanceColors' do
        expect { tasting_sheet_form.save }.to \
          change(AppearanceColor, :count).by(2)
      end

      it 'saves Flavor' do
        expect { tasting_sheet_form.save }.to \
          change(Flavor, :count).by(1)
      end

      it 'saves 2 FlavorFirstImpressions' do
        expect { tasting_sheet_form.save }.to \
          change(FlavorFirstImpression, :count).by(2)
      end

      it 'saves 2 FlavorFruits' do
        expect { tasting_sheet_form.save }.to \
          change(FlavorFruit, :count).by(2)
      end

      it 'saves 2 FlavorFlowers' do
        expect { tasting_sheet_form.save }.to \
          change(FlavorFlower, :count).by(2)
      end

      it 'saves 2 FlavorSpices' do
        expect { tasting_sheet_form.save }.to \
          change(FlavorSpice, :count).by(2)
      end

      it 'saves 2 FlavorImpressions' do
        expect { tasting_sheet_form.save }.to \
          change(FlavorImpression, :count).by(2)
      end

      it 'saves Taste' do
        expect { tasting_sheet_form.save }.to \
          change(Taste, :count).by(1)
      end

      it 'saves Conclusion' do
        expect { tasting_sheet_form.save }.to \
          change(Conclusion, :count).by(1)
      end
    end

    context 'with invalid params' do
      it "doesn't save TastingSheet with invalid appearance" do
        tasting_sheet_form.appearance[:clarity] = ''
        expect { tasting_sheet_form.save }.to \
          change(TastingSheet, :count).by(0)
      end

      it "doesn't save TastingSheet with invalid flavor" do
        tasting_sheet_form.flavor[:flavor_fruits] = []
        expect { tasting_sheet_form.save }.to \
          change(TastingSheet, :count).by(0)
      end

      it "doesn't save TastingSheet with invalid taste" do
        tasting_sheet_form.taste[:attack] = ''
        expect { tasting_sheet_form.save }.to \
          change(TastingSheet, :count).by(0)
      end

      it "doesn't save TastingSheet with invalid conclusion" do
        tasting_sheet_form.conclusion[:evaluation] = ''
        expect { tasting_sheet_form.save }.to \
          change(TastingSheet, :count).by(0)
      end
    end
  end
end
