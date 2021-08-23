class Stock < ApplicationRecord
  has_many :dividends, dependent: :destroy
  has_many :quotes, dependent: :destroy
  has_many :values, dependent: :destroy
  belongs_to :account, touch: true

  def sell(amount, value)
    total_value = amount * value
    account.balance += total_value
    quotes.first(amount).destroy
  end

  def total_invested
    quotes.sum(:aquisition_value).round(2)
  end

  def updated_balance
    value = if values.order('date desc').first.nil?
              quotes.order('aquisition_date desc').first.aquisition_value
            else
              values.order('date desc').first&.value
            end

    value * quotes.count
  end
  # TODO create a method to calculate balance of a specific month
  # def month_balance
  #   value = if values.where(date:  desc').first.nil?
  #             quotes.order('aquisition_date desc').first.aquisition_value
  #           else
  #             values.order('date desc').first&.value
  #           end

  #   value * quotes.count
  # end

  # get the current value of stock
  def current_value
    if values.order('date desc').first&.value.nil?
      quotes.order('aquisition_date desc').first&.aquisition_value
    else
      values.order('date desc').first&.value
    end
  end

  def monthly_value
    if values.empty?
      quotes.group_by_month(:aquisition_date, last: 12, current: true).average('aquisition_value')
      # quotes.order('aquisition_date desc').first&.aquisition_value
    else
      values.group_by_month(:date, last: 12, current: true).average('value')
    end
end
  
  
end
