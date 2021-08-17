module BalancesHelper
  def last_balance(account_id)
    last_balance = Balance.where(account_id: account_id).order('date asc').first
    account = Account.find(account_id)

    account.generate_balance if last_balance.nil? || last_balance.created_at < account.updated_at
    Account.find(account_id).balances.last.balance
  end
end
