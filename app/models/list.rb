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
#

class List < ActiveRecord::Base
  has_many :reviews,          :dependent => :destroy
  accepts_nested_attributes_for :reviews
  after_initialize :default_values
  
  attr_accessible :address, :city, :state, :zip, :region, :bedrooms, :bathrooms, 
    :rent, :squarefeet, :parking, :smoking, :pets, :heat, :electric, :flags, :gas, 
    :garbagecollection, :ltype, :length, :furnished, :laundry
  
  attr_searchable :address, :city, :state, :zip, :region, :bedrooms, :bathrooms, 
    :rent, :squarefeet, :parking, :smoking, :pets, :heat, :electric, :flags, :gas, 
    :garbagecollection, :ltype, :length, :furnished, :laundry
  
  #requires that these three are filled in + add some validations
  validates :address,     :presence => true,
                          :length   => { :maximum => 50 }, 
                          :uniqueness => { :case_sensitive => false}
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
                          :message => "must be a Madison zip code" 
  validates :bathrooms, :numericality => {:gt => 0, :lte => 6}
  
  
  #sets default values for the db entry when the listing is initialized
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
    self.ltype ||= true
  end
  
 
  ROOMS = (1..25).to_a
  ROOMS.insert(0, nil);
  #BATHS = (1..10).to_a
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


  

end
