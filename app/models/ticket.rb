class Ticket < ActiveRecord::Base
  validates_presence_of :email, message: "can't be blank"
  before_create :create_unique_token

  belongs_to :stuff
  has_many :comments, :dependent => :destroy
  attr_accessible :email
  attr_protected :comments
  accepts_nested_attributes_for :comments

  private
  def create_unique_token
  	begin
  		self.token = SecureRandom.hex(5)
  	end while self.class.exists?(token: token)
  end
end
