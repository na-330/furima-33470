class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false, maxlength: 8
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building
      t.string :phone_number, null: false, maxlength: 11
      t.integer :prefecture_id, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
