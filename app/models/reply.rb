class Reply < ActiveRecord::Base
	belongs_to :comment
  attr_accessible :context
end
