# frozen_string_literal: true

class FlavorForm < ApplicationForm
  attr_accessor :flavor_first_impressions, :flavor_fruits, :flavor_flowers,
                :flavor_spices, :flavor_impressions, :tasting_sheet_id

  validates :tasting_sheet_id, presence: true
  validates :flavor_first_impressions, :flavor_fruits, :flavor_flowers,
            :flavor_spices, :flavor_impressions, array_length_check: true

  def save
    saved = true
    flavor = Flavor.new(tasting_sheet_id: tasting_sheet_id)

    ActiveRecord::Base.transaction do
      saved &= flavor.save
      first_impressions(flavor.id).each { |first_impression| saved &= first_impression.save }
      fruits(flavor.id).each { |fruit| saved &= fruit.save }
      flowers(flavor.id).each { |flower| saved &= flower.save }
      spices(flavor.id).each { |spice| saved &= spice.save }
      impressions(flavor.id).each { |impression| saved &= impression.save }

      raise ActiveRecord::Rollback unless saved
    end
    saved
  end

  private

  def first_impressions(flavor_id)
    flavor_first_impressions
      .map { |first_impression| FlavorFirstImpression.new(first_impression: first_impression, flavor_id: flavor_id) }
  end

  def fruits(flavor_id)
    flavor_fruits
      .map { |fruit| FlavorFruit.new(fruit: fruit, flavor_id: flavor_id) }
  end

  def flowers(flavor_id)
    flavor_flowers
      .map { |flower| FlavorFlower.new(flower: flower, flavor_id: flavor_id) }
  end

  def spices(flavor_id)
    flavor_spices
      .map { |spice| FlavorSpice.new(spice: spice, flavor_id: flavor_id) }
  end

  def impressions(flavor_id)
    flavor_impressions
      .map { |impression| FlavorImpression.new(impression: impression, flavor_id: flavor_id) }
  end
end
