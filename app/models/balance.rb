class Balance < ApplicationRecord
  belongs_to :account

  before_create :set_date

  private

  def set_date
    self.date = DateTime.current unless date
  end
end
