class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :enterprise
      t.string :email
      t.string :phone
      t.string :reason_for_contact
      t.text :description

      t.timestamps
    end
  end
end
