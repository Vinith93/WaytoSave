class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :bio, :string
    add_column :users, :birth_day, :datetime
    add_column :users, :twitter, :string
    add_column :users, :login, :string
  end
end
