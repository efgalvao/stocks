class Stock < ApplicationRecord
  has_many :dividends, dependent: :destroy
  has_many :quotes, dependent: :destroy
  has_many :values, dependent: :destroy
  belongs_to :account

  def sell(amount, value)
    total_value = amount * value
    account.balance += total_value
    quotes.first(amount).destroy
  end

  def total_amount
    value = values.order('date').first&.value || quotes.order('aquisition_date desc').first.aquisition_value
    value * quotes.count
  end
end
