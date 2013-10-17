class AddUserStuffRelationship < ActiveRecord::Migration
  def up
  	change_table :stuffs do |t|
  		t.references :user
  	end
  end

  def down
  	remove_column :stuffs, :user_id
  end
end
