class Account < ApplicationRecord
  has_many :balances
  has_many :stocks

  def generate_balance
    stocks
    total = stocks.inject(0) { |sum, stock| stock.total_amount + sum }
    balances.create(balance: total)
  end
end
