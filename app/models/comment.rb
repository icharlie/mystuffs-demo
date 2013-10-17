class Comment < ActiveRecord::Base
  belongs_to :ticket
  has_many	:reply
  attr_accessible :context
end
