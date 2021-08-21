class Quote < ApplicationRecord
  belongs_to :stock, touch: true

  before_create :set_aquisition_date

  # scope :average_price, -> { }
  # scope :bought_last_month, -> { where(:aquisition_date => DateTime.current - 1.month)}
  scope :bought_this_month, -> { where("aquisition_date > ? AND aquisition_date < ?", Time.now.beginning_of_month, Time.now.end_of_month) }
  # Ex:- scope :active, -> {where(:active => true)}

  def self.average_price
    average('aquisition_value')
  end

  # def self.monthly_average_price
  #   result = group_by_month(:aquisition_date, last: 12, current: true).average('aquisition_value')
  #   print(',=====================', result)
  # end

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
