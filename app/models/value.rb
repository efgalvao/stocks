class Value < ApplicationRecord
  belongs_to :stock

  def self.monthly_value
    group_by_month(:date, last: 12, current: true).maximum('value')
  end

end
