class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :email
      t.references :stuff

      t.timestamps
    end
  end
end
