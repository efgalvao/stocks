class CreateBalances < ActiveRecord::Migration[6.0]
  def change
    create_table :balances do |t|
      t.float :balance
      t.datetime :date
      t.belongs_to :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
