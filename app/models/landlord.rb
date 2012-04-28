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

class Landlord < ActiveRecord::Base
  has_many :lists
  attr_accessible :name, :email, :website, :phone,
                  :address, :city, :state, :zip
  
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name,        :presence => true,
                          :uniqueness => { :case_sensitive => false }
  validates :email,       :presence => true,
                          :format => { :with => email_regex },
                          :uniqueness => { :case_sensitive => false }
  
  #TODO: Will have to decide how to deal with the phone numbers.  They are stored as strings, so we have plenty of flexibility
  validates :phone,       :presence => true,
                          :uniqueness => { :case_sensitive => false }
  validates :city,        :presence => true
  validates :zip,         :presence => true
  
  validates_inclusion_of  :zip, 
                          :in => 53700..53800, #judging by: http://www.zip-codes.com/city/WI-MADISON.asp
                          :message => "must be in the Madison-area"
  
  
  #TODO: Before saving/creating, I want to format the website so that http:// is at the front, if it's not already
end
