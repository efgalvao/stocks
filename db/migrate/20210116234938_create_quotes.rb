class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.datetime :aquisition_date
      t.float :aquisition_value, null: false
      t.belongs_to :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
