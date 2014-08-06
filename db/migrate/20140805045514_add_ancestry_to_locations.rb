class AddAncestryToLocations < ActiveRecord::Migration
  def change
  	   	add_column :locations, :ancestry, :string
  	   	add_column :locations, :ancestry_depth, :integer, :default => 0
  end
end
