module BalancesHelper
  def last_balance(account_id)
    account = Account.find(account_id)

    account.generate_balance if account.balances.order('date desc').first.nil? ||
                                account.balances.current.updated_at < account.updated_at
    Account.find(account_id).balances.last.balance
  end
end
