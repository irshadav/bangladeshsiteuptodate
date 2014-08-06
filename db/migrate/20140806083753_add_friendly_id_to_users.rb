class AddFriendlyIdToUsers < ActiveRecord::Migration
  def change
  	add_column :Users, :slug, :string
  	add_index :Users, :slug
  end
end
