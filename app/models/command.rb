require 'uri'

class Command < ActiveRecord::Base
  attr_accessible :user_id, :parent_id, :keyword, :url, :name, :description, :shared, :use_http_post, :use_url_encoding
  
  belongs_to :user
  has_many :queries, :dependent => :destroy
  belongs_to :parent, :class_name => 'Command'
  has_many :children, :class_name => 'Command', :foreign_key => 'parent_id'
  
  before_save :infer_domain
  
  validates_presence_of :keyword, :url, :name
  
  def self.stopwords
    %w(
      user_commands commands tags queries users opensearch
      default_to delete search_form search_all execute update tag_set tag_add_remove find_by_ids
      bookmarklets shortcuts options quicksearches
    )
  end
  
  def urls
    URI.extract(self.url)
  end
    
  def execute(args=[])
    result = []
    unless args.empty?
      args_as_js_array_elements = args.map do |arg|
        !!(arg.to_s =~ /^[-+]?[0-9]+$/) ? arg : "'#{arg}'"
      end.join(", ")
      result << "args = [#{args_as_js_array_elements}]"
    end
    result << url
    result.join(";\n")
  end
  
  def clone(user)
    clone = self.dup
    clone.user_id = user.id
    clone.parent_id = self.id if original?
    clone.save!
    clone.reload
    clone
  end
  
  def bookmarklet?
    self.bookmarklet
  end
  
  def escape?
    self.use_url_encoding
  end
  
  def original?
    self.parent_id.blank?
  end
  
  def cloned?
    !original?
  end
  
  def to_param
    keyword
  end

  private

  def infer_domain
    self.domain = self.urls.try(:first).try(:domain_without_www)
    true
  end  

    
end
