class Value < ApplicationRecord
  belongs_to :stock, touch: true

  before_create :set_date

  scope :past_date, ->(date) { where("date <= ?", date) }


  def self.monthly_value
    group_by_month(:date, last: 12, current: true).average('value')
  end

  private

  def set_date
    self.date = DateTime.current unless date
  end
end
