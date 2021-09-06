class CreateBalances < ActiveRecord::Migration[6.0]
  def change
    create_table :balances do |t|
      t.float :balance
      t.datetime :date
      t.references :balanceable, polymorphic: true

      t.timestamps
    end
  end
end
