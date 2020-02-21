class AddUsersToContact < ActiveRecord::Migration[6.0]
  def change
    add_reference :contacts, :primary
    add_reference :contacts, :secondary
  end
end
