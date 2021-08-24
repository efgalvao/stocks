module AccountsHelper
  def total
    total = 0
    Account.includes(:balances).all.each do |account|
      next if account.balances.newest_balance.blank?

      total += account.balances.newest_balance.balance
    end
    total
  end

  def free_total
    total = 0
    Account.includes(:balances).savings_accounts.each do |account|
      next if account.balances.newest_balance.blank?

      total += account.balances.newest_balance.balance
    end
    total
  end

  def locked_total
    total = 0
    Account.includes(:balances).stocks_accounts.each do |account|
      next if account.balances.newest_balance.blank?

      total += account.balances.newest_balance.balance
    end
    total
  end
end
