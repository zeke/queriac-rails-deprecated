class Command < ActiveRecord::Base
  attr_accessible :boolean, :boolean, :boolean, :description, :integer, :integer, :keyword, :name, :shared, :sister_id, :text, :url, :use_http_post, :use_url_encoding, :user_id
end
