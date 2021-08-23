class Account < ApplicationRecord
  has_many :balances, dependent: :destroy
  has_many :stocks, dependent: :destroy

  def generate_balance
    total = stocks.inject(0) { |sum, stock| stock.updated_balance + sum }
    if balances.current.nil?
      balances.create(balance: total)
    else
      balance = balances.current
      balance.balance = total
    end
    balance
  end

  def total_invested
    total = 0
    stocks.each do |stock|
      total += stock.total_invested
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
