class CreateDividends < ActiveRecord::Migration[6.0]
  def change
    create_table :dividends do |t|
      t.date :date
      t.float :value
      t.belongs_to :facade, null: false, foreign_key: true

      t.timestamps
    end
  end
end
