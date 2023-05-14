# frozen_string_literal: true

FactoryBot.define do
  factory :taste do
    attack        { '軽い' }
    sweetness     { 'ドライ' }
    acidity       { 'なめらかな' }
    bitterness    { '控えめ' }
    astringent    { 'サラサラとした' }
    balance       { 'スマートな' }
    alcohol       { '軽い' }
    after_taste   { '短い' }
    tasting_sheet
  end
end
