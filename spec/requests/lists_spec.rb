require 'spec_helper'

describe 'Listings' do
  
  describe 'flagging' do
    
    it "should increment the flag variable" do
      List.create!(:address => "1022 W Johnson St. #507", :city => "Madison", :state => "Wisconsin", :zip => 53715, :region => 2, :bedrooms => 3, :bathrooms => 2, :rent => 2660, :parking => true, :smoking => false, :pets => false, :heat => false, :flags => 10, :gas => true, :garbagecollection => true, :length => 12, :furnished => false, :laundry => true, :ltype => true)
      lambda do
          visit list_path(List.find(1))
          click_button "Flag"
          response.should render_template('lists/show')
      end.should change(List.find(1), :flags).by(1)
    end
    
    it "should not increment the flag variable" do
      List.create!(:address => "1022 W Johnson St. #507", :city => "Madison", :state => "Wisconsin", :zip => 53715, :region => 2, :bedrooms => 3, :bathrooms => 2, :rent => 2660, :parking => true, :smoking => false, :pets => false, :heat => false, :flags => 10, :gas => true, :garbagecollection => true, :length => 12, :furnished => false, :laundry => true, :ltype => true)
      lambda do
          visit list_path(List.find(1))
          List.find(1).update_attributes!(:flags => nil)
          click_button("Flag")
          response.should render_template('lists/show')
      end.should_not change(List.find(1), :flags).by(1)
    end
    
  end
  
  describe 'searching' do
    
    it "should yield nothing is found page" do
      visit home_page_path
      click_button "Submit Search Criteria"
      response.should render_template('home/_no_results')
    end
    
    it "should return no results" do
      visit home_page_path
      fill_in "Address",                      :with => "Street"
      click_button "Submit Search Criteria"
      response.should render_template('home/_no_results')
      
      visit home_page_path
      fill_in "Address",                      :with => "Street Street"
      click_button "Submit Search Criteria"
      response.should render_template('home/_no_results')
      
      visit home_page_path
      fill_in "Address",                      :with => "Foobar Foobar"
      click_button "Submit Search Criteria"
      response.should render_template('home/_no_results')
    end
    
    describe "admin page" do
      before(:each) do
        @user = Factory(:user) 
        @user.toggle!(:admin)
        visit signin_path
        fill_in :Email,       :with => @user.Email
        fill_in :password,    :with => @user.password
        click_button
      end
      
      it "should sign an admin out" do
        response.should render_template('users/admin')
        controller.should be_signed_in
        click_link "Sign out"
        controller.should_not be_signed_in
      end
      
      it "should have search results" do
        visit admin_path
        fill_in :admin_ls,                :with => "foobar"
        click_button "Search"
      end
    end
    
  end
end
