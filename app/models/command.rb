class Command < ActiveRecord::Base
  attr_accessible :user_id, :sister_id, :keyword, :url, :name, :description, :shared, :use_http_post, :use_url_encoding
  
  belongs_to :user
  has_many :queries, :dependent => :destroy
  
end
