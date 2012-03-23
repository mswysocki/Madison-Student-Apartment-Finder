# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
  
    List.create!(:Address => "18 Lathrop St.", :City => "Madison", :State => "Wisconsin", :Zip => 53726, :Region => 3, :Bedrooms => 3, :Bathrooms => 1, :Rent => 1600, :Parking => false, :Smoking => false, :Pets => false, :Heat => false, :Flags => 10, :Gas => true, :GarbageCollection => true, :House => true, :Length => 12, :Furnished => false, :Laundry => true)
    List.create!(:Address => "412 Paunack Pl", :City => "Madison", :State => "Wisconsin", :Zip => 53726, :Region => 3, :Bedrooms => 3, :Bathrooms => 1, :Rent => 1400, :Parking => true, :Smoking => false, :Electric => false, :Pets => false, :Heat => true, :Flags => 5, :Gas => true, :GarbageCollection => false, :House => true, :Length => 12, :Furnished => false, :Laundry => false)
    List.create!(:Address => "Address3", :City => "Madison", :State => "Wisconsin", :Zip => 53706, :Region => 1, :Bedrooms => 5, :Bathrooms => 2, :Rent => 2600, :SquareFeet => 2000, :Parking => true, :Smoking => false, :Electric => false, :Pets => false, :Heat => false, :Flags => 0, :Gas => true, :GarbageCollection => true, :House => false, :Length => 12, :Furnished => false, :Laundry => true)      
    List.create!(:Address => "Address4", :City => "Madison", :State => "Wisconsin", :Zip => 53716, :Region => 2, :Bedrooms => 8, :Bathrooms => 6, :Rent => 5500, :SquareFeet => 5000, :Parking => true, :Smoking => true, :Pets => true, :Heat => true, :Flags => 0, :Gas => false, :GarbageCollection => false, :House => true, :Length => 12, :Furnished => false, :Laundry => true)
    List.create!(:Address => "Address5", :City => "Madison", :State => "Wisconsin", :Zip => 53726, :Region => 3, :Bedrooms => 1, :Bathrooms => 1, :Rent => 800, :SquareFeet => 500, :Parking => false, :Smoking => false, :Pets => false, :Electric => false, :Heat => false, :Flags => 0, :Gas => false, :GarbageCollection => false, :House => false, :Length => 12, :Furnished => false, :Laundry => false)
    List.create!(:Address => "Address6", :City => "Madison", :State => "Wisconsin", :Zip => 53706, :Region => 1, :Bedrooms => 2, :Bathrooms => 1, :Rent => 1200, :SquareFeet => 1000, :Parking => true, :Smoking => false, :Pets => false, :Heat => false, :Flags => 0, :Gas => true, :GarbageCollection => true, :House => false, :Length => 12, :Furnished => false, :Laundry => true)


