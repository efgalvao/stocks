class Stock < ApplicationRecord
  belongs_to :facade

  def self.average_price
    self.all.sum('aquisition_value')
  end

  def self.monthly_average_price
    group_by_month(:aquisition_date, last: 12, current: true).average_price
  end
end
