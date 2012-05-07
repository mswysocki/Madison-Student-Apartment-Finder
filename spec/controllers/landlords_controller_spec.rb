require 'spec_helper'

describe LandlordsController do
  render_views
  
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
      @listing1 = Factory(:list, :landlord_id => @landlord.id)
      @listing2 = Factory(:list, :address => "New Address", :landlord_id => @landlord.id)
      session[:return_to] = home_page_path
    end
  
    it "should be succesful" do
      get :show, :id => @landlord
      response.should be_success
    end
    
    it "should have the right title" do
      get :show, :id => @landlord
      response.should have_selector("title", :content => "Madison Student Housing Finder | #{@landlord.name}")
    end
    
    it "should contain the name of the landlord" do
      get :show, :id => @landlord
      response.should have_selector("body", :content => @landlord.name)
    end
    
    it "should show a table with listings in it" do
      get :show, :id => @landlord
      response.should have_selector("table")
    end
    
    it "should show the first listing associated with the landlord" do
      get :show, :id => @landlord
      response.should have_selector("tr", :content => @listing1.address)
    end
    
    it "should show the second listing associated with the landlord" do
      get :show, :id => @landlord
      response.should have_selector("tr", :content => @listing2.address)
    end
  end
  
  
  describe 'POST "create"' do
    describe 'failure' do
      before(:each) do
        @attr = { :name => "", :email => "", :website => "", :city => "", :phone => "" }
      end
      
      it "should not create a landlord" do
        lambda do
          post :create, :landlord => @attr
        end.should_not change(Landlord, :count)
      end
      
      it "should have the right title" do
        post :create, :landlord => @attr
        response.should have_selector("title", :content => "New Landlord")
      end
      
      it "should render the 'new' page" do
        post :create, :landlord => @attr
        response.should render_template('new')
      end
    end
    
    describe 'success' do
      before(:each) do
        @attr = { :name => "New Landlord", :email => "a@abc.com", :phone => "6087903393",
                      :city => "Madison", :zip => 53726, :website => "www.google.com" }
      end
      
      it "should create a new landlord" do
        lambda do
          get :index
          post :create, :landlord => @attr
        end.should change(Landlord, :count).by(1)
      end
      
      it "should redirect to the show page" do
        get :index
        post :create, :landlord => @attr
        response.should redirect_to(landlord_path(assigns(:landlord)))
      end
    end
  end











end
