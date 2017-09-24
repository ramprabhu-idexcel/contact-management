class AddAgeToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :age, :integer, length: 3, null: false
  end
end
