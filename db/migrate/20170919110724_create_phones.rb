class CreatePhones < ActiveRecord::Migration[5.1]
  def change
    create_table :phones do |t|
      t.string :number
      t.string :type_of
      t.references :contact, index: true, foreign_key: true
      t.timestamps
    end
  end
end
