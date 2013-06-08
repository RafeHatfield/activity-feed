require 'spec_helper'

describe "Activities" do
  describe "GET /activities" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get activities_path
      response.status.should be(200)
    end
  end
  
  describe "GET /activities/feed" do
    it "should be successful" do
      get "activities/feed"
      response.status.should be(200)
    end
  end
  
  describe "POST /activities" do
    before :all do
      ActivityType.create!(:name => "article_posted", :thumbnail_name => "article_posted")
    end
 
    context "with valid parameters" do
      before :each do
         @valid_parameters = {:message => "This is a test message", :permalink => "http://www.google.ca", :activity_type_name => "article_posted"}
      end
      it "should be successful"
      it "should create a new activity"
    end
  end
end
