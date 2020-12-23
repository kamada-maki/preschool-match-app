class CreatePreschools < ActiveRecord::Migration[6.0]
  def change
    create_table :preschools do |t|
      t.string :name,              null: false
      t.string :post_number,       null:false
      t.integer :area_id,          null: false
      t.string :address,           null: false
      t.string :phone_number,      null: false
      t.string :station,           null: false
      t.time :open_hour,           null: false
      t.time :close_hour,          null: false
      t.integer :capacity ,        null: false
      t.integer :category_id ,     null: false
      t.string :concept,           null:false
      t.references :admin,         foreign_key: true
      t.string :email,             null: false
      t.float :latitude,           null:false
      t.float :longitude,          null:false
      t.timestamps
    end
  end
end