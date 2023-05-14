# frozen_string_literal: true

FactoryBot.define do
  factory :appearance_form do
    clarity                { '澄んだ' }
    brightness             { '輝きのある' }
    intensity              { '無色に近い' }
    consistency            { 'さらっとした' }
    appearance_colors      { %w[紫がかった オレンジがかった] }
    appearance_impressions { %w[若々しい 若い状態を抜けた] }
    tasting_sheet_id       { FactoryBot.create(:tasting_sheet).id }
  end
end
