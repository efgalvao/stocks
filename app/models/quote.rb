class Quote < ApplicationRecord
  belongs_to :stock, touch: true

  before_create :set_aquisition_date

  scope :bought_this_month, lambda {
                              where("aquisition_date > ? AND aquisition_date < ?",
                                    Time.current.beginning_of_month,
                                    Time.current.end_of_month)
                            }

  def self.average_price
    average('aquisition_value')
  end

  def self.month_qty
    group_by_month(:aquisition_date, last: 12, current: true).count.each_with_object({}) do |(date, total), cumulative|
      cumulative[date] = total + (cumulative.values.last || 0)
    end
  end

  private

  def set_aquisition_date
    self.aquisition_date = DateTime.current unless aquisition_date
  end
end
