class CreateValues < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.datetime :date
      t.float :price
      t.belongs_to :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
