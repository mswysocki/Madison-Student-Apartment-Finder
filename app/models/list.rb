# == Schema Information
#
# Table name: lists
#
#  id                :integer         not null, primary key
#  Address           :string(255)
#  City              :string(255)
#  State             :string(255)
#  Zip               :integer
#  Region            :integer
#  Bathrooms         :float
#  Rent              :integer
#  SquareFeet        :integer
#  Smoking           :boolean
#  Heat              :boolean
#  Electric          :boolean
#  Flags             :integer
#  created_at        :datetime
#  updated_at        :datetime
#  Gas               :boolean
#  GarbageCollection :boolean
#  Length            :integer
#  Furnished         :boolean
#  Laundry           :boolean
#  Parking           :boolean
#  Bedrooms          :integer
#  Pets              :boolean
#  Type              :boolean
#

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
      temp = ""
      list_parameters["Address"].split.map!  {|word|
      if STREETS.key?(word.downcase)
        word = STREETS[word.downcase][0] + "."  
      end
      word.capitalize!
      temp += word + " "
    }.join(" ")
    return temp
    end


  

end
