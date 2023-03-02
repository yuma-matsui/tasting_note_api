# frozen_string_literal: true

class TasteResource < ApplicationResource
  attributes :attack, :sweetness, :acidity, :bitterness,
             :astringent, :balance, :alcohol, :after_taste
end
