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
    
    it "attempts to infer the command domain before save"
    
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
      @command.url = "http://foo.com/{{q}}"
    end
    
    it "returns an encoded URL with a query injected into it" do
      @command.use_url_encoding = true
      @command.execute('hoi polloi').should == "window.location='http://foo.com/hoi%20polloi';"
    end
    
    it "doesn't encode the URL if encoding is disabled on the command" do
      @command.use_url_encoding = false
      @command.execute('hoi polloi').should == "window.location='http://foo.com/hoi polloi';"
    end
        
    it "doesn't wrap bookmarklets in `window.location` assignment string" do
      @command.url = "alert('foo');"
      @command.bookmarklet = true
      @command.execute.should == "alert('foo');"
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
