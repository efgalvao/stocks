class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :name, null: false, index: { unique: true }
      t.boolean :savings

      t.timestamps
    end
  end
end
