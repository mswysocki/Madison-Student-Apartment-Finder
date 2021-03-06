# == Schema Information
#
# Table name: lists
#
#  id                :integer         not null, primary key
#  address           :string(255)
#  city              :string(255)
#  state             :string(255)
#  zip               :integer
#  region            :integer
#  bathrooms         :float
#  rent              :integer
#  squarefeet        :integer
#  smoking           :boolean
#  heat              :boolean
#  electric          :boolean
#  flags             :integer
#  created_at        :datetime
#  updated_at        :datetime
#  gas               :boolean
#  garbagecollection :boolean
#  length            :integer
#  furnished         :boolean
#  laundry           :boolean
#  parking           :boolean
#  bedrooms          :integer
#  pets              :boolean
#  ltype             :boolean
#  user_id           :integer
#  aptnum            :integer
#  building_name     :string(255)
#  landlord_id       :integer
#
require 'file_size_validator' 
class List < ActiveRecord::Base
  has_many :reviews,          :dependent => :delete_all
  belongs_to :landlord
  accepts_nested_attributes_for :reviews
  after_initialize :default_values
  mount_uploader :image, ImageUploader
  
  validates :image, 
    #:presence => true, 
    :file_size => { 
      :maximum => 0.25.megabytes.to_i 
    } 
  
  attr_accessible :address,     :city,              :state, 
                  :zip,         :region,            :bedrooms, 
                  :bathrooms,   :rent,              :squarefeet, 
                  :parking,     :smoking,           :pets, 
                  :heat,        :electric,          :flags, 
                  :gas,         :garbagecollection, :ltype, 
                  :length,      :furnished,         :laundry, 
                  :aptnum,      :building_name,     :landlord_id,
				          :image,       :remote_image_url
                  
  attr_accessor   :landlord_name
  
  attr_searchable :address,     :city,              :state, 
                  :zip,         :region,            :bedrooms, 
                  :bathrooms,   :rent,              :squarefeet,   
                  :parking,     :smoking,           :pets, 
                  :heat,        :electric,          :flags, 
                  :gas,         :garbagecollection, :ltype,
                  :length,      :furnished,         :laundry, 
                  :aptnum,      :building_name
  
  validates :address,     :presence => true,
                          :length   => { :maximum => 50 }, 
                          :uniqueness => { :case_sensitive => false}, :unless => :apartment?
  validates :bedrooms,    :presence => true,
                          :format => { :with => /^\d+??(?:\.\d{0,2})?$/ },  
                          :numericality => {:gt => 0, :lte => 25}
  validates :rent,        :presence => true,
                          :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }
  validates :zip,         :presence => true,
                          :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }
  
  validates_inclusion_of  :rent, 
                          :in => 1..25000, 
                          :message => "is not valid"
  validates_inclusion_of  :zip, 
                          :in => 53700..53800, #judging by: http://www.zip-codes.com/city/WI-MADISON.asp
                          :message => "must be in the Madison-area" 
  validates :bathrooms,   :numericality => {:gt => 0, :lte => 6}
  
  with_options :if => :sqft_valid? do |sqft|
    sqft.validates_inclusion_of     :squarefeet,
                                    :in => 0..25000,
                                    :message => "is out of range"
  end  
  
  with_options :if => :region_valid? do |region|
    region.validates_inclusion_of   :region,
                                    :in => 0..5, 
                                    :message => "is out of range"
  end
  
  validates_inclusion_of  :ltype,
                          :in => [true, false], 
                          :message => "must be checked"
						  
  #validates_attachment_presence :photo
  #validates_attachment_size :photo, :less_than => 1.megabytes
  #validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
                          
  with_options :if => :apartment? do |apartment|
    apartment.validates :aptnum,  :presence => true, 
                                  :numericality => {:gt => 0},
                                  :format => {:with => /^\d+??(?:\.\d{0,2})?$/ }
    
    apartment.validates :building_name, 
                                  :presence => true
  end
  
  

 
  def default_values
    self.city ||= "Madison"
    self.state ||= "Wisconsin"
    self.length ||= 12
    self.furnished ||= false
    self.electric ||= false
    self.gas ||= false
    self.garbagecollection ||= false
    self.smoking ||= false
    self.pets ||= false
    self.laundry ||= false
    self.parking ||= false
    self.heat ||= false
    self.flags ||= 0
  end
  
 
  ROOMS = (1..25).to_a
  ROOMS.insert(0, nil);
  BATHS = [nil, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0, 5.5, 6.0]
  STREETS = {
      "street" => ["st",            "street"],   
      "place" => ["pl",             "place" ],   
      "road" => ["rd",              "road"  ],   
      "avenue" => ["ave",           "avenue"],   
      "boulevard" => ["blvd",       "boulevard"],
      "court" => ["ct",             "court" ],   
      "fork" => ["fk",              "fork"  ],   
      "square" => ["sq",            "square"],   
      "lane" => ["ln",              "lane"  ],   
      "loop" => ["lp",              "loop"  ],   
      "terrace" => ["ter", "terr",  "terrace"],
      "drive" => ["dr",             "drive" ],   
      "circle" => ["ci", "cr",      "circle"],   
      "junction" => ["jct",         "junction"],
      "highway" => ["hwy",          "highway"],
      "alley" =>   ["aly",          "alley"],
      "parkway" => ["pkwy",         "parkway"],
      "mall" => [                   "mall"],
      "route" => ["rte",            "route"] 
  }
  
 
  #returns true if there are no search results on a given search, false otherwise
  def self.no_results search_all
    if (search_all.nil? || search_all.length == 0) 
      #puts "I should be in here when there are no results..."
      return true
    else
      #puts "I should be in here when there are search results..."
      return false
    end
  end
  
  
  #Cuts out the street abbreviation in the search string
  #Option is there to instead make it lower case if there is a match
  def self.street_endings address_contains
    if (address_contains.blank?) 
      return nil
    end
    searched_addr = address_contains
    
    address_contains = address_contains.split
    numElements = address_contains.size
    abbr = address_contains.last.downcase
    
    #if they only search one thing, ignore below and return
    if (numElements == 1)
      return searched_addr
    end
    
    STREETS.each { |key, value| 
      #puts "#{key} is #{value}" 
      value.each do |str|
        if abbr.include?(str)
          address_contains.delete_at(numElements-1)
          #address_contains[numElements -1] = str
          #puts address_contains.join(" ")
          return address_contains.join(" ")
        end
      end
    }
    
    #if they did not include a suffix, return original
    return searched_addr
  end
 
  def self.format_address! list_parameters
    if list_parameters["address"].nil? 
      return
    end
    
    temp = ""
    size = list_parameters["address"].split.size;
    i = 0
    
    list_parameters["address"].split.map!  {|word|
      if STREETS.key?(word.downcase)
        if (i == size -1)   #ensures it only happens for the last part of address
          word = STREETS[word.downcase][0] + "."
        end  
      end
      word.capitalize!
      temp += word + " "
      i += 1
    }.join(" ")
    return temp
  end


  def self.admin_list_search(search)
    if search
      where('address LIKE ?', "%#{search}%")
    else
      scoped
    end
  end


  def apartment?
    ltype == false
  end
  
  def sqft_valid?
    squarefeet.presence
  end
  
  def region_valid?
    region.presence
  end
  

end
