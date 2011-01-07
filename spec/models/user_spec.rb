require "spec_helper"

describe User do
  it "has none to begin with" do
    User.count.should == 0
  end
  
  it "should create from hash" do
    User.create_from_hash!({'user_info' => {'name' => 'victor'}})
    User.count.should == 1
    User.delete_all
  end
  
  
end