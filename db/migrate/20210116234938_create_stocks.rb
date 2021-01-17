class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.date :aquisition_date
      t.float :aquisition_value
      t.belongs_to :facade, null: false, foreign_key: true

      t.timestamps
    end
  end
end
