class Stock < ApplicationRecord
  has_many :dividends, dependent: :destroy
  has_many :quotes, dependent: :destroy
  has_many :prices, dependent: :destroy
  belongs_to :account, touch: true

  def sell(amount, price)
    total_value = amount * price
    account.balance += total_value
    quotes.first(amount).destroy
  end

  def total_invested
    quotes.sum(:aquisition_value).round(2)
  end

  def updated_balance
    price = if prices.order('date desc').first.nil?
              quotes.order('aquisition_date desc').first&.aquisition_value
            else
              prices.order('date desc').first&.price
            end
    return 0 if value.nil?

    price * quotes.count
  end

  def current_price
    if prices.order('date desc').first&.price.nil?
      quotes.order('aquisition_date desc').first&.aquisition_value
    else
      prices.order('date desc').first&.price
    end
  end

  def total_current_price
    return 0 if current_price.nil?

    current_price * quotes.count
  end

  def monthly_price
    if prices.empty?
      quotes.group_by_month(:aquisition_date, last: 12, current: true).average('aquisition_value')
    else
      pricess.group_by_month(:date, last: 12, current: true).average('price')
    end
  end

  def past_stock_balance(date)
    price = if pricess.past_date(date).order('date desc').first.nil?
              quotes.past_date(date).order('aquisition_date desc').first&.aquisition_value
            else
              prices.past_date(date).order('date desc').first&.price
            end
    quotes_count = quotes.past_date(date).count
    price * quotes_count
  end
end
