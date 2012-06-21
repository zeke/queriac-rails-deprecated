class Query < ActiveRecord::Base
  attr_accessible :command_id, :input, :user_id
  
  belongs_to :command
end
