class Stuff < ActiveRecord::Base
  #include ActiveModel::ForbiddenAttributesProtection

  validates_presence_of :name, :message => "can't be blank"
  validates_presence_of :user_id, on: :create
  attr_accessible :name, :price, :tag_list
  attr_protected :assets

  belongs_to :user
  has_many :assets, :dependent => :destroy
  has_many :tickets, :dependent => :destroy

  accepts_nested_attributes_for :assets

  acts_as_taggable
end
