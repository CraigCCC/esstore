class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :describle
      t.decimal :list_price
      t.decimal :sell_price
      t.string :sku
      t.integer :status
      t.integer :quantity

      t.timestamps
    end
  end
end
