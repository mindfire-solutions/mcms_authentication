class AddUsernameToUsers < ActiveRecord::Migration
  def change

    add_column :mcms_users, :first_name, :string

    add_column :mcms_users, :last_name, :string
    
  end
end
