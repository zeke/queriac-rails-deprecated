require 'spec_helper'

describe User do

  describe "associations" do
    
    it "has_many commands" do
      User.reflect_on_association(:commands).macro.should == :has_many
    end

    it "has_many queries through commands" do
      r = User.reflect_on_association(:queries)
      r.macro.should == :has_many
      r.options.should have_key(:through)
      r.options[:through].should == :commands
    end

  end

end
