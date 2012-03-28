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
  
  
  
end
