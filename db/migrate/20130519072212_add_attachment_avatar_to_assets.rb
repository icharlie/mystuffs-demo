class AddAttachmentAvatarToAssets < ActiveRecord::Migration
  def self.up
    change_table :assets do |t|
      t.references :stuff
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :assets, :avatar
    remove_column :assets, :stuff_id
  end
end
