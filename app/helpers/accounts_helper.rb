module AccountsHelper
  def total
    total = 0
    Account.includes(:balances).all.each do |account|
      next if account.balances.newest_balance.blank?

      total += account.balances.newest_balance.balance
    end
    total
  end
end
