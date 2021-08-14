module BalancesHelper
  def last_balance(account_id)
    last_balance = Balance.where(account_id: account_id).order('date asc').first

    Account.find(account_id).generate_balance if last_balance.nil? || last_balance.date + 1.day < DateTime.current
    Account.find(account_id).balances.last.balance
  end
end
