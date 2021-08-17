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

  # def total_invested
  #   value = values.order('date').first&.value || quotes.order('aquisition_date desc').first.aquisition_value
  #   value * quotes.count
  # end

  def updated_balance
    value = if values.order('date desc').first.nil?
              quotes.order('aquisition_date desc').first.aquisition_value
            else
              values.order('date desc').first&.value
            end

    value * quotes.count
  end
end
