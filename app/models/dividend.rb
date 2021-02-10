class Dividend < ApplicationRecord
  belongs_to :facade

  def self.monthly_dividend
    group_by_month(:date, last: 12, current: true).maximum('value')
  end
end
