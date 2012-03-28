require 'spec_helper'

describe UsersController do
  render_views
  
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'new' 
      response.should have_selector("title", :content => "Sign up")
    end
  end
  
  describe "GET 'show'" do
    
    before(:each) do
      @user = Factory(:user) 
    end
    
    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end
    
    it  "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
    
    it "should have the right title" do
      get :show, :id => @user 
      response.should have_selector("title", :content => "Madison Student Housing Finder | " << @user.Name)
    end
    
    it "should contain the user's name" do
      get :show, :id => @user
      response.should have_selector("h3", :content => @user.Name)
    end
    
    
  end
  
  
  
end
