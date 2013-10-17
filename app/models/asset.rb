class Asset < ActiveRecord::Base
  belongs_to :stuff
  attr_accessible :avatar
  has_attached_file :avatar, styles: { :medium => "300x300>", :thumb => "100x100>" }
end
