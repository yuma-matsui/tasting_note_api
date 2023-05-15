# frozen_string_literal: true

FactoryBot.define do
  factory :tasting_sheet_form do
    name    { 'test-sheet' }
    color   { 'red' }
    time    { '5' }
    user_id { FactoryBot.create(:user).id }
    appearance do
      {
        clarity: '澄んだ',
        brightness: '輝きのある',
        intensity: '無色に近い',
        consistency: 'さらっとした',
        appearance_colors: %w[紫がかった オレンジがかった],
        appearance_impressions: %w[若々しい 若い状態を抜けた]
      }
    end
    flavor do
      {
        flavor_first_impressions: %w[閉じている 控えめ],
        flavor_fruits: %w[柑橘類 青リンゴ],
        flavor_flowers: %w[スイカズラ 白バラ],
        flavor_spices: %w[コリアンダー 丁子],
        flavor_impressions: %w[若々しい 嫌気的な]
      }
    end
    taste do
      {
        attack: '軽い',
        sweetness: 'ドライ',
        acidity: 'なめらかな',
        bitterness: '控えめ',
        astringent: 'サラサラとした',
        balance: 'スマートな',
        alcohol: '軽い',
        after_taste: '短い'
      }
    end
    conclusion do
      {
        evaluation: 'エレガントで余韻の長い',
        optimum_temperature: '10度未満',
        decantage: '必要なし',
        glass: '小ぶり',
        vintage: '1930',
        country: '日本',
        grape: '甲州'
      }
    end
  end
end
