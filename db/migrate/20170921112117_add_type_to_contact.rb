class AddTypeToContact < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :type, :string, null: false
  end
end
