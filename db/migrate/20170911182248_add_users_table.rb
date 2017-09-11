class AddUsersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name

      t.timestamp null: false
    end
  end
end
