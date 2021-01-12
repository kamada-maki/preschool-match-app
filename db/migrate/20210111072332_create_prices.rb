class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.integer :category_id ,     null: false
      t.integer :age ,     null: false
      t.integer :free_price ,     null: false
      t.integer :not_free_price,     null: false
      t.timestamps
    end
  end
end
