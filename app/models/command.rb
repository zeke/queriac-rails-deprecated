require 'uri'

class Command < ActiveRecord::Base
  attr_accessible :user_id, :sister_id, :keyword, :url, :name, :description, :shared, :use_http_post, :use_url_encoding
  
  belongs_to :user
  has_many :queries, :dependent => :destroy
  has_one :sister, :class_name => 'Command', :foreign_key => 'sister_id'
  has_many :little_brothers, :class_name => 'Command', :foreign_key => 'sister_id'
  
  validates_presence_of :keyword, :url, :name
  
  def self.stopwords
    %w(
      user_commands commands tags queries users opensearch
      default_to delete search_form search_all execute update tag_set tag_add_remove find_by_ids
      bookmarklets shortcuts options quicksearches
    )
  end
  
  def execute(query='')
    out = self.url.sub("{{q}}", query)
    use_url_encoding ? URI.escape(out) : out
  end
  
  amoeba do
    exclude_field :queries
    exclude_field :user_id
    customize(lambda { |oldie,newbie|
      newbie.sister_id = oldie.id
    })
  end

  def clone(user)
    clone = self.dup
    clone.user_id = user.id
    clone.save!
    clone.reload
    clone
  end
    
    
end
