class Facade < ApplicationRecord
  has_many :dividends
  accepts_nested_attributes_for :dividends, allow_destroy: true
  has_many :stocks
  accepts_nested_attributes_for :stocks, allow_destroy: true
  has_many :values
  accepts_nested_attributes_for :values, allow_destroy: true
end
