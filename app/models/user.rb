class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  validate :username, :email, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :current_password

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :current_password, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_many :stuffs, :dependent => :destroy

  validates_confirmation_of :password
end
