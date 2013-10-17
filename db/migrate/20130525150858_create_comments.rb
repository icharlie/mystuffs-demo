class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :context
      t.references :ticket

      t.timestamps
    end
    add_index :comments, :ticket_id
  end
end
