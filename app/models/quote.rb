class Quote < ApplicationRecord
  belongs_to :stock

  # scope :average_price, -> { }

  def self.average_price
    self.all.average('aquisition_value')
  end

  def self.monthly_average_price
    result = group_by_month(:aquisition_date, last: 12, current: true).average_price
  end
end
