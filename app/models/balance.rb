class Balance < ApplicationRecord
  belongs_to :account, touch: true

  before_create :set_date

  # Balance of current month
  scope :current, lambda {
                    where(date: DateTime.current.beginning_of_month..DateTime.current
                      .end_of_month)
                  }

  def monthly_balance
    group_by_month(:date, last: 12, current: true).maximum('balance')
  end

  private

  def set_date
    self.date = DateTime.current unless date
  end
end
