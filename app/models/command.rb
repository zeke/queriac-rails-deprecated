class Command < ActiveRecord::Base
  attr_accessible :user_id, :sister_id, :keyword, :url, :name, :description, :shared, :use_http_post, :use_url_encoding
  
  belongs_to :user
  has_many :queries, :dependent => :destroy
  
  def self.stopwords
    %w(
      user_commands commands tags queries users opensearch
      default_to delete search_form search_all execute update tag_set tag_add_remove find_by_ids
      bookmarklets shortcuts options quicksearches
    )
  end
  
  
  
end
