class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :available, :integer
    add_column :users, :role, :integer
  end
end
