class Account < ApplicationRecord
  has_many :balances, dependent: :destroy
  has_many :stocks, dependent: :destroy

  def generate_balance
    stocks
    total = stocks.inject(0) { |sum, stock| stock.updated_balance + sum }
    balances.create(balance: total)
  end
end
