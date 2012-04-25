require 'spec_helper'

describe "LayoutLinks" do
  
  it "should have a home page at '/'" do
    get '/' 
    response.should have_selector('title', :content => "Home")
  end
  
  it "should have an about page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end
  
  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end
  
  it "should have a signin page at '/signin'" do
    get '/signin'
    response.should have_selector('title', :content => "Sign in")
  end
  
  it "should have a new listing page at '/new_listing'" do
    get '/new_listing'
    response.should have_selector('title', :content => "New Listing")
  end
  
  describe "when not signed in" do
    it "should have a signin link" do
      visit home_page_path
      response.should have_selector("div", :id => "SignInFields")
    end
  end
  
  describe "when signed in" do
    
    #sign in beforehand
    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :email,       :with => @user.email
      fill_in :password,    :with => @user.password
      click_button
    end
    
    
    it "should have a signout link" do
      visit home_page_path
      response.should have_selector("a", :href => signout_path,
                                         :content => "Sign out")
    end
    
    it "should have a profile link" do
      visit home_page_path
      response.should have_selector("a", :href => user_path(@user),
                                         :content => "Profile")
    end
    
  end
  
end
