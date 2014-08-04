class AddUserinformationToUser < ActiveRecord::Migration
  def change
  	add_column :users, :role, :integer
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :degree_level, :string
  end
end
