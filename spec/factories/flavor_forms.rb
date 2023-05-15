# frozen_string_literal: true

FactoryBot.define do
  factory :flavor_form do
    flavor_first_impressions { %w[閉じている 控えめ] }
    flavor_fruits            { %w[柑橘類 青リンゴ] }
    flavor_flowers           { %w[スイカズラ 白バラ] }
    flavor_spices            { %w[コリアンダー 丁子] }
    flavor_impressions       { %w[若々しい 嫌気的な] }
    tasting_sheet_id         { FactoryBot.create(:tasting_sheet).id }
  end
end
