require "spec_helper"

describe User do
  it "has none to begin with" do
    User.count.should == 0
  end
end