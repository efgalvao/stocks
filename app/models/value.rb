class Value < ApplicationRecord
  belongs_to :stock

  before_create :set_date

  def self.monthly_value
    group_by_month(:date, last: 12, current: true).maximum('value')
  end

  private

  def set_date
    self.date = DateTime.current unless date
  end
end
