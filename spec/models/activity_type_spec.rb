require 'spec_helper'

describe ActivityType do
  
  before :each do
    @valid_activity_type = ActivityType.new(:name => "test", :thumbnail_name => "test")
  end
  
  it "should be valid with valid inputs" do
    @valid_activity_type.should be_valid
  end
  
  it "should require a name" do
    @valid_activity_type.name = ""
    @valid_activity_type.should_not be_valid
  end
  
  it "should require a thumbnail name" do
    @valid_activity_type.thumbnail_name = ""
    @valid_activity_type.should_not be_valid
  end
  
  it "should have a list of associated activities" do
    @valid_activity_type.should respond_to(:activities)
  end
  
  it "should give an appropriate thumbnail url" do
    @valid_activity_type.thumbnail_url.should eql("http://graphics.suite101.com/activity_feed_icon_test_32.png")
  end
  
end
