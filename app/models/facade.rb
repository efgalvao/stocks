class Facade < ApplicationRecord
  has_many :dividends, dependent: :destroy
  accepts_nested_attributes_for :dividends, allow_destroy: true
  has_many :stocks, dependent: :destroy
  accepts_nested_attributes_for :stocks, allow_destroy: true
  has_many :values, dependent: :destroy
  accepts_nested_attributes_for :values, allow_destroy: true

  def multiline
    
  end
end
