class Value < ApplicationRecord
  belongs_to :stock, touch: true

  before_create :set_date, :update_stock

  def self.monthly_value
    group_by_month(:date, last: 12, current: true).average('value')
  end

  private

  def set_date
    self.date = DateTime.current unless date
  end

  def update_stock
    stock.total_invested += value
    stock.save
  end
end
