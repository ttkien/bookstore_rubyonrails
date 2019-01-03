class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.float :unit
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
