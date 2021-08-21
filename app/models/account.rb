class Account < ApplicationRecord
  has_many :balances, dependent: :destroy
  has_many :stocks, dependent: :destroy

  # TODO: Find a way to retrieve the last balance if there were no changes
  def generate_balance
    total = stocks.inject(0) { |sum, stock| stock.updated_balance + sum }
    balances.create(balance: total)
  end

  def total_invested
    total = 0
    stocks.each do |stock|
      total += stock.total_invested
    end
  end
end
