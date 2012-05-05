require 'spec_helper'

describe "Users" do
  
  describe "signup" do
    
    describe "failure" do
      
      it "should not make a new user" do
        lambda do
          visit signup_path
          fill_in "Name",                 :with => ""
          fill_in "Email",                :with => ""
          fill_in "Password",             :with => ""
          fill_in "Password Confirmation",         :with => ""
          click_button
          response.should render_template('users/new')
          response.should have_selector("div", :class => "flash error") 
        end.should_not change(User, :count)
      end
    end
    
    #describe "success" do
    #  it "should make a new user" do
    #    lambda do
    #      visit signup_path
    #      fill_in "Name",                 :with => "Example User" 
    #      fill_in "Email",                :with => "email@mail.com"
    #      fill_in "Password",             :with => "password" 
    #      fill_in "Password Confirmation",         :with => "password"
    #      click_button
    #      #response.should have_selector("div.flash.success", :content => "Welcome")
    #      #response.should render_template('users/show/')
    #    end.should change(User, :count).by(1)
    #  end
    #end
  end
  
  
  
  describe "sign in/out" do
    describe "failure" do
      it "should not sign a user in" do
        visit signin_path
        fill_in :Email,       :with => ""
        fill_in :password,    :with => ""
        click_button
        response.should have_selector("div.flash.error", :content => "Invalid")
      end
    end
    
    describe "success" do
      it "should sign a user in and out" do
        user = Factory(:user) 
        visit signin_path
        fill_in :email,       :with => user.email
        fill_in :password,    :with => user.password
        click_button
        controller.should be_signed_in
        click_link "Sign out"
        controller.should_not be_signed_in
      end
    end
  end
  
  
  
  
end
