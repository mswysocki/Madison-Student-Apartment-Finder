class List < ActiveRecord::Base
  attr_accessible :Address, :City, :State, :Zip, :Region, :Bedrooms, 
    :Bathrooms, :Rent, :SquareFeet, :Parking, :Smoking, :Pets, :Heat, 
    :Electric, :Flags
  
  #requires that these three are filled in + add some validations
  validates :Address,   :presence => true,
                        :length   => { :maximum => 50 }, 
                        :uniqueness => { :case_sensitive => false}
  validates :Bedrooms,  :presence => true,
                        :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, 
                        :numericality => {:greater_than => 0, :less_than => 25}
  validates :Rent,      :presence => true,
                        :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, 
                        :numericality => {:greater_than => 1, :less_than => 25000}
  validates :Zip,       :presence => true
  
  #sets default values for the db entry when the listing is saved
  after_initialize :default_values
  def default_values
    self.City ||= "Madison"
    self.State ||= "Wisconsin"
    self.Flags ||= 0
  end

end
