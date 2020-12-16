class CreatePreschools < ActiveRecord::Migration[6.0]
  def change
    create_table :preschools do |t|
      t.string :name, null: false
      t.string :post_number, null:false
      t.integer :area_id, null: false
      t.string :street_number, null: false
      t.string :building
      t.string :phone_number, null: false
      t.station :phone_number, null: false
      t.time :open_hour, null: false
      t.time :close_hour, null: false
      t.integer :capacity , null: false
      t.integer :category_id , null: false
      t.string :concept, null:false
      t.references :admin, foreign_key: true
      t.timestamps
    end
  end
end