require 'spec_helper'

describe LandlordsController do
  render views
  
  describe "GET 'new'" do 
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'new'
      response.should have_selector("title", :content => "Madison Student Housing Finder | New landlord")
    end
  end
  
  
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end 
    
    it "should have the right title" do
      get :index
      response.should have_selector("title", :content => "Madison Student Housing Finder | All landlords")
    end
  end
  
  
  describe "GET 'show'" do
    before(:each) do
      @landlord = Factory(:landlord)
    end
  
    it "should be succesful" do
      get :show, :id => @landlord.id
      response.should be_success
    end
    
    it "should have the right title" do
      get :show, :id => @landlord.id
      response.should have_selector("title", :content => "Madison Student Housing Finder | #{@landlord.name}")
    end
  end

end
