class Account < ApplicationRecord
  has_many :balances, dependent: :destroy
  has_many :stocks, dependent: :destroy

  scope :savings_accounts, -> { where(savings: true) }

  scope :stocks_accounts, -> { where(savings: false) }

  def generate_balance
    total = stocks.inject(0) { |sum, stock| stock.updated_balance + sum }
    if balances.current.blank?
      balance = balances.create(balance: total)
    else
      balance = balances.current
      balance.balance = total
    end
    balance.save
    balance
  end

  def total_invested
    total = 0
    stocks.each do |stock|
      total += stock.total_invested
    end
  end

  def monthly_balance
    generate_balance if balances.empty?
    balances.group_by_month(:date, last: 12, current: true).average('balance')
  end
end
