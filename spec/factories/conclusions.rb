# frozen_string_literal: true

FactoryBot.define do
  factory :conclusion do
    evaluation          { 'エレガントで余韻の長い' }
    optimum_temperature { '10度未満' }
    decantage           { '必要なし' }
    glass               { '小ぶり' }
    vintage             { '1930' }
    country             { '日本' }
    grape               { '甲州' }
    tasting_sheet
  end
end
