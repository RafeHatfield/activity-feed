require 'spec_helper'

describe Activity do
  
  before :each do
    valid_attributes = {:message => "test", :permalink => "http://www.google.ca", :activity_type_id => 5}
    @valid_activity = Activity.new(valid_attributes)
  end
  
  it "should be valid with valid inputs" do
    @valid_activity.should be_valid
  end
  
  it "should require a message" do
    @valid_activity.message = ""
    @valid_activity.should_not be_valid
  end
  
  it "should require a permalink" do
    @valid_activity.permalink = ""
    @valid_activity.should_not be_valid
  end
  
  it "should require a positive integer activity_type_id" do
    @valid_activity.activity_type_id = "hello"
    @valid_activity.should_not be_valid
    @valid_activity.activity_type_id = 0
    @valid_activity.should_not be_valid
  end
  
  it "should have an activity_type" do
    @valid_activity.should respond_to(:activity_type)
  end
  
end
