require 'uri'

class Command < ActiveRecord::Base
  attr_accessible :user_id, :parent_id, :keyword, :script, :name, :description, :shared
  
  belongs_to :user
  has_many :queries, :dependent => :destroy
  belongs_to :parent, :class_name => 'Command'
  has_many :children, :class_name => 'Command', :foreign_key => 'parent_id'
  
  validates_presence_of :keyword, :script, :name, :user
  validates_uniqueness_of :keyword, :scope => :user_id
  before_save :infer_domain
  # validates_exclusion_of :keyword, :in => %w(foo bar), :message => "That keyword is reserved."
  
  def urls
    URI.extract(self.script)
  end
    
  def execute(args=[])
    
    # Save the query
    self.queries.create(input: args.join(" "))

    result = []
    
    # Prepend arguments (named and unnamed) to the JS output
    if args.present?
      positionals = []
      args.each do |arg|
        
        # named argument like 'user:bob'...          
        if arg.to_s =~ /:/          
          k, v = arg.to_s.split(":")
          # wrap strings in single quotes, leave numbers alone
          v = "'#{v}'" unless v.to_s =~ /^[-+]?[0-9]+$/
          result << "var #{k} = #{v}"
        
        # unnamed positional argument like 'monkeys'
        else
          arg = "'#{arg}'" unless arg.to_s =~ /^[-+]?[0-9]+$/
          positionals << arg
        end
        end
      
      result << "args = [#{positionals.join(", ")}]"
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
