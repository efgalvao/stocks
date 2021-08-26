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
              quotes.order('aquisition_date desc').first&.aquisition_value
            else
              values.order('date desc').first&.value
            end
    return 0 if value.nil?

    value * quotes.count
  end

  def current_value
    if values.order('date desc').first&.value.nil?
      quotes.order('aquisition_date desc').first&.aquisition_value
    else
      values.order('date desc').first&.value
    end
  end

  def total_current_value
    return 0 if current_value.nil?

    current_value * quotes.count
  end

  def monthly_value
    if values.empty?
      quotes.group_by_month(:aquisition_date, last: 12, current: true).average('aquisition_value')
    else
      values.group_by_month(:date, last: 12, current: true).average('value')
    end
  end

  def past_stock_balance(date)
    value = if values.past_date(date).order('date desc').first.nil?
              quotes.past_date(date).order('aquisition_date desc').first&.aquisition_value
            else
              values.past_date(date).order('date desc').first&.value
            end
    quotes_count = quotes.past_date(date).count
    value * quotes_count
  end
end
