require 'spec_helper'

describe Query do

  describe "associations" do
    
    it "belongs_to command" do
      Query.reflect_on_association(:command).macro.should == :belongs_to
    end

  end

end
