class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :context
      t.references :comment

      t.timestamps
    end
  end
end
