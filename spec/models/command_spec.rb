require 'spec_helper'

describe Command do
  
  before do
    @command = create(:command)
  end
  
  describe "validation" do
    
    it "is valid" do
      @command.should be_valid
    end
    
    it "requires keyword" do
      @command.keyword = nil
      @command.should have(1).error_on(:keyword)
    end
        
    it "requires url" do
      @command.url = nil
      @command.should have(1).error_on(:url)
    end
    
    it "requires name" do
      @command.name = nil
      @command.should have(1).error_on(:name)
    end
    
    it "validates uniqueness of keyword, scoped to user"
    
    it "validatates that keyword is not a stopword"
    
  end
  
  describe "callbacks" do
    
    it "attempts to infer the command domain before save" do
      @command.url = "window.location='http://google.com';"
      @command.save!
      @command.domain.should == "google.com"
    end
    
    it "gracefully handles absence of a domain in the command" do
      @command.url = "console.log('bobo');"
      @command.save!
      @command.domain.should be_nil
    end
    
    
  end
  
  describe "associations" do

    it "has_many queries" do
      Command.reflect_on_association(:queries).macro.should == :has_many
    end
    
    it "belongs_to user" do
      Command.reflect_on_association(:user).macro.should == :belongs_to 
    end

  end
  
  describe "execution" do
    
    before do
      @command.url = "alert('foo');"
    end
    
    it "prepends arguments to first line of output" do
      @command.execute(['fish']).should == "args = ['fish'];\nalert('foo');"
    end
    
    it "doesn't require args and doesn't prepend an argument string if no arguments are present" do
      @command.execute.should == "alert('foo');"
    end
    
    it "differents numerical args from string args" do
      @command.execute(['bobo', 1, -1]).should == "args = ['bobo', 1, -1];\nalert('foo');"
    end
            
  end
  
  describe "cloning" do
    
    before do
      @user = double('user', :id => 1)
      @user2 = double('user', :id => 2)
    end
    
    it "is original if it doesn't have a parent_id" do
      @command.parent_id = nil
      @command.original?.should == true
      @command.cloned?.should == false
    end
    
    it "is cloned if it's not original" do
      @command.parent_id = 1
      @command.original?.should == false
      @command.cloned?.should == true
    end

    it "can be cloned to another user" do
      cloned_command = @command.clone(@user)
      cloned_command.user_id.should == 1
    end
  
    it "retains a relationship with its parent" do
      clone = @command.clone(@user)
      clone.parent_id.should == @command.id
      clone.parent.should == @command
    end

    it "retains a relationship with its children" do
      c2 = @command.clone(@user)
      c3 = @command.clone(@user2)
      @command.children.size.should == 2
    end

    
  end
  
end
