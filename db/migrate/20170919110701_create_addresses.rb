class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :door_no, length: 10
      t.string :street
      t.string :city
      t.string :state
      t.string :pincode
      t.string :landmark, default: ''
      t.references :contact, index: true, foreign_key: true
      t.timestamps
    end
  end
end
