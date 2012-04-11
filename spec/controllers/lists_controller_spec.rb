require 'spec_helper'

describe ListsController do
  render_views
  
  #Basic tests for index of the lists controller
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'index'
      response.should have_selector("title", :content => "Madison Student Housing Finder | Search Results")
    end
  end
  
  #basic tests for show
  describe "GET 'show'" do
    it "should be successful" do
      listing = List.create!(:address => "1022 W Johnson St. #507", :city => "Madison", :state => "Wisconsin", :zip => 53715, :region => 2, :bedrooms => 3, :bathrooms => 2, :rent => 2660, :parking => true, :smoking => false, :pets => false, :heat => false, :flags => 10, :gas => true, :garbagecollection => true, :length => 12, :furnished => false, :laundry => true, :ltype => true)
      get 'show', :id => listing.id
      response.should be_success
    end
    
    it "should have the right title" do
      listing = List.create!(:address => "1022 W Johnson St. #507", :city => "Madison", :state => "Wisconsin", :zip => 53715, :region => 2, :bedrooms => 3, :bathrooms => 2, :rent => 2660, :parking => true, :smoking => false, :pets => false, :heat => false, :flags => 10, :gas => true, :garbagecollection => true, :length => 12, :furnished => false, :laundry => true, :ltype => true)
      get 'show', :id => listing.id
      response.should have_selector("title", :content => "Madison Student Housing Finder | " << listing.address)
    end
  end
  
  
  describe "GET 'new'" do
    it "should have the right title" do
      get 'new' 
      response.should have_selector("title", :content => "Madison Student Housing Finder | New Listing")
    end
  end
  
  
  describe "GET 'edit'" do
    it "should have the right title" do
      listing = List.create!(:address => "1022 W Johnson St. #507", :city => "Madison", :state => "Wisconsin", :zip => 53715, :region => 2, :bedrooms => 3, :bathrooms => 2, :rent => 2660, :parking => true, :smoking => false, :pets => false, :heat => false, :flags => 10, :gas => true, :garbagecollection => true, :length => 12, :furnished => false, :laundry => true, :ltype => true)
      get 'edit', :id => listing.id
      response.should have_selector("title", :content => "Madison Student Housing Finder | Update Listing")
    end
  end
  
  
  #The tests below are commented out because I don't know how to set them up correctly.  They aren't specific pages on the site, only commands, so I don't think the way the tests are set up are correct as they are now
  
  
  # attempt to do the create testing but I don't know rspec enough to do so at this point
  #describe "POST 'create'" do
  #  it "should be successful" do
  #    listing = List.create(:Address => "1022 W Johnson St. #507", :City => "Madison", :State => "Wisconsin", :Zip => 53715, :Region => 2, :Bedrooms => 3, :Bathrooms => 2, :Rent => 2660, :Parking => true, :Smoking => false, :Pets => false, :Heat => false, :Flags => 10, :Gas => true, :GarbageCollection => true, :House => true, :Length => 12, :Furnished => false, :Laundry => true, :Type => true)
  #    post 'create', :params => listing
  #    response.should be_success
  #  end
  #end
  
  #Similar failings to the create code...I don't know how to pass what I need into the controller
  #describe "PUT 'update'" do
  #  it "should be successful" do
  #    listing = List.create!(:Address => "1022 W Johnson St. #507", :City => "Madison", :State => "Wisconsin", :Zip => 53715, :Region => 2, :Bedrooms => 3, :Bathrooms => 2, :Rent => 2660, :Parking => true, :Smoking => false, :Pets => false, :Heat => false, :Flags => 10, :Gas => true, :GarbageCollection => true, :House => true, :Length => 12, :Furnished => false, :Laundry => true, :Type => true)
  #    put 'update', :id => listing.id, :params => listing
  #    response.should be_success
  #  end
  #end
  
  
end
