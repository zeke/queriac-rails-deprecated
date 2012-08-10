require 'uri'

class Command < ActiveRecord::Base
  attr_accessible :user_id, :parent_id, :keyword, :script, :name, :description, :shared
  
  belongs_to :user
  has_many :queries, :dependent => :destroy
  belongs_to :parent, :class_name => 'Command'
  has_many :children, :class_name => 'Command', :foreign_key => 'parent_id'
  
  before_save :infer_domain
  
  validates_presence_of :keyword, :script, :name, :user
  validates_uniqueness_of :keyword, :scope => :user_id
  # validates_exclusion_of :keyword, :in => %w(foo bar), :message => "That keyword is reserved."
  
  def urls
    URI.extract(self.script)
  end
    
  def execute(args=[])
    result = []
    
    # Prepend an `args` array to the JS output
    unless args.empty?
      args_as_js_array_elements = args.map do |arg|
        !!(arg.to_s =~ /^[-+]?[0-9]+$/) ? arg : "'#{arg}'"
      end.join(", ")
      result << "args = [#{args_as_js_array_elements}]"
    end
    
    result << script
    result.join(";\n")
  end
  
  def fork(user)
    fork = self.dup
    fork.user_id = user.id
    fork.parent_id = self.id
    fork.save!
    fork.reload
    fork
  end
    
  def original?
    self.parent_id.blank?
  end
  
  def forked?
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
