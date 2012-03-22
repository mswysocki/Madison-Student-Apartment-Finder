# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
  
    List.create!(:Address => "18 Lathrop St.", :City => "Madison", :State => "Wisconsin", :Zip => 53726, :Region => 3, :Bedrooms => 3, :Bathrooms => 1, :Rent => 1600, :Parking => false, :Smoking => 0, :Pets => "None", :Heat => 0, :Flags => 10, :Gas => true, :GarbageCollection => true, :Type => 1, :Length => 12, :Furnished => false, :Laundry => true)
    List.create!(:Address => "412 Paunack Pl", :City => "Madison", :State => "Wisconsin", :Zip => 53726, :Region => 3, :Bedrooms => 3, :Bathrooms => 1, :Rent => 1400, :Parking => true, :Smoking => 0, :Pets => "None", :Heat => 1, :Flags => 5, :Gas => true, :GarbageCollection => false, :Type => 1, :Length => 12, :Furnished => false, :Laundry => false)
