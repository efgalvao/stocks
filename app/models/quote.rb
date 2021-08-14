class Quote < ApplicationRecord
  belongs_to :stock

  before_create :set_aquisition_date

  # scope :average_price, -> { }

  # def self.average_price
  #   self.all.average('aquisition_value')
  # end

  # def self.monthly_average_price
  #   result = group_by_month(:aquisition_date, last: 12, current: true).average_price
  # end

  private

  def set_aquisition_date
    self.aquisition_date = DateTime.current unless self.aquisition_date
  end
end
