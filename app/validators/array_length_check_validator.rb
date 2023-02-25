# frozen_string_literal: true

class ArrayLengthCheckValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, '2つ選択してください' unless value.length == 2
  end
end
