class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :name
      t.float  :total_invested, default: 0
      t.belongs_to :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
