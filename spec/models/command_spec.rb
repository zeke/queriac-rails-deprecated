require 'spec_helper'

describe Command do
  
  describe "associations" do

    it "has_many queries" do
      Command.reflect_on_association(:queries).macro.should == :has_many
    end
    
    it "belongs_to user" do
      Command.reflect_on_association(:user).macro.should == :belongs_to 
    end

  end
  
end
