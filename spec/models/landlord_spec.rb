# == Schema Information
#
# Table name: landlords
#
#  id      :integer         not null, primary key
#  name    :string(255)
#  email   :string(255)
#  website :string(255)
#  phone   :string(255)
#  address :string(255)
#  city    :string(255)
#  state   :string(255)
#  zip     :integer
#

require 'spec_helper'

describe Landlord do
  before(:each) do
    @attr = {
      :name => "Example Landlord",
      :email => "landlord@landlord.com",
      :website => "www.google.com", 
      :phone => "6087903394",
      :address => "18 Lathrop St.",
      :city => "Madison",
      :state => "Wisconsin",
      :zip => 53726
    }
  end
  
  it "should create a new landlord instance given valid attributes" do
    Landlord.create!(@attr)
  end
  
  it "should require a name" do
    no_name_landlord = Landlord.new(@attr.merge(:name => ""))
    no_name_landlord.should_not be_valid
  end
  
  it "should not require an email" do
    no_email_landlord = Landlord.new(@attr.merge(:email => ""))
    no_email_landlord.should be_valid
  end
  
  it "should require a phone number" do
    no_phone_landlord = Landlord.new(@attr.merge(:phone => ""))
    no_phone_landlord.should_not be_valid
  end

  it "should require a city" do
    no_city_landlord = Landlord.new(@attr.merge(:city => ""))
    no_city_landlord.should_not be_valid
  end
  
  it "should require a zip code" do
    no_zip_landlord = Landlord.new(@attr.merge(:zip => nil))
    no_zip_landlord.should_not be_valid
  end
  
  it "should accept valid email attributes" do
    addresses = %w[landlord@foo.com THE_LANDLORD@foo.bar.org first.last@foo.jp]
    addresses.each do |address| 
      valid_email_landlord = Landlord.new(@attr.merge(:email => address))
      valid_email_landlord.should be_valid
    end
  end
  
  it "should not accept invalid email addresses" do
    addresses = %w[landlord@foo,com landlord_at_foo.org example,user@foo.]
    addresses.each do |address|
      invalid_email_landlord = Landlord.new(@attr.merge(:email => address))
      invalid_email_landlord.should_not be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    Landlord.create!(@attr)
    landlord_dup = Landlord.new(@attr.merge(:name => "foobar landlord"))
    landlord_dup.should_not be_valid
  end
  
  it "shoulde reject duplicate names" do
    Landlord.create!(@attr)
    landlord_dup = Landlord.new(@attr.merge(:email => "foo@afoo.com"))
    landlord_dup.should_not be_valid
  end
  
  it "shoulde reject zips out of Madison area" do
    landlord_zip_out_of_range = Landlord.new(@attr.merge(:zip => 54603))
    landlord_zip_out_of_range.should_not be_valid
  end
  
  it "should reject phone numbers that are too long" do
    landlord_long_phone = Landlord.new(@attr.merge(:phone => "1234567890123456"))
    landlord_long_phone.should_not be_valid
  end
end
