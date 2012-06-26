require 'spec_helper'

describe Command do
  
  before do
    @command = create(:command)
  end
  
  describe "validation" do
    
    it "is capable of being valid" do
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
      @command.execute('hoi polloi').should == "http://foo.com/hoi%20polloi"
    end
    
    it "doesn't encode the URL if encoding is disabled on the command" do
      @command.use_url_encoding = false
      @command.execute('hoi polloi').should == "http://foo.com/hoi polloi"
    end
    
    it "works for commands that don't take queries" do
      @command.url = 'blah'
      @command.execute.should == 'blah'
    end
    
  end
  
  describe "cloning" do
    
    before do
      @user = mock('user')
      @user.should_receive(:id).and_return(123)
    end

    it "can be cloned to another user" do
      cloned_command = @command.clone(@user)
      cloned_command.user_id.should == 123
    end
  
    it "retains a relationship with its sister command"# do
      # cloned_command = @command.clone(@user)
      # cloned_command.sister.should == @command
    # end
    
  end
  
end
