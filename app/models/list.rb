class List < ActiveRecord::Base
  attr_accessible :Address, :City, :State, :Zip, :Region, :Bedrooms, 
    :Bathrooms, :Rent, :SquareFeet, :Parking, :Smoking, :Pets, :Heat, 
    :Electric, :Flags, :Gas, :GarbageCollection, :Type, :Length, :Furnished,
    :Laundry
  
  attr_searchable :Address, :City, :State, :Zip, :Region, :Bedrooms,
    :Bathrooms, :Rent, :SquareFeet, :Parking, :Smoking, :Pets, :Heat, 
    :Electric, :Flags, :Gas, :GarbageCollection, :Type, :Length, :Furnished,
    :Laundry
  
  
  #requires that these three are filled in + add some validations
  validates :Address,   :presence => true,
                        :length   => { :maximum => 50 }, 
                        :uniqueness => { :case_sensitive => false}
  validates :Bedrooms,  :presence => true,
                        :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, 
                        :numericality => {:gt => 0, :lte => 25}
  validates :Rent,      :presence => true,
                        :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, 
                        :numericality => {:gt => 1, :lt => 25000}
  validates :Zip,       :presence => true,
						            :numericality => {:gt => 53700, :lt => 53800} #judging by: http://www.zip-codes.com/city/WI-MADISON.asp
  validates :Bathrooms, :numericality => {:gt => 0, :lte => 10}
  
  
  #sets default values for the db entry when the listing is initialized
  after_initialize :default_values
  def default_values
    self.City ||= "Madison"
    self.State ||= "Wisconsin"
    self.Length ||= 12
    self.Furnished ||= false
    self.Electric ||= false
    self.Gas ||= false
    self.GarbageCollection ||= false
    self.Smoking ||= false
    self.Pets ||= false
    self.Laundry ||= false
    self.Parking ||= false
    self.Heat ||= false
    self.Flags ||= 0
  end
  
 
  ROOMS = (1..25).to_a
  BATHS = (1..10).to_a
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
    searched_addr = address_contains
    
    address_contains = address_contains.split
    numElements = address_contains.size
    abbr = address_contains.last.downcase
    
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
 


  

end
