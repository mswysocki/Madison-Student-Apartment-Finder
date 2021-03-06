Factory.define :user do |user| 
  user.name                       "Example Name"
  user.email                      "email@mail.com"
  user.password                   "password"
  user.password_confirmation      "password"
  user.auth_token                 SecureRandom.urlsafe_base64
end

Factory.sequence :email do |n| 
  "person-#{n}@example.com"
end

Factory.define :review do |review|
  review.review_body "body of the review (comment)"
  review.rating       4
  review.helpfulness  0
  review.association :list
  review.association :user
end


Factory.define :list do |list| 
  list.address                    "Sample Listing Address"
  list.city                       "Madison"
  list.state                      "Wisconsin"
  list.zip                        53726
  list.bathrooms                  2
  list.rent                       1800
  list.squarefeet                 2000
  list.smoking                    nil
  list.heat                       nil
  list.length                     nil
  list.electric                   true
  list.flags                      true
  list.gas                        nil
  list.garbagecollection          nil
  list.furnished                  nil
  list.laundry                    nil
  list.parking                    nil
  list.bedrooms                   5
  list.pets                       nil
  list.ltype                      true
  list.aptnum                     nil
  list.building_name              nil
  list.landlord_id                nil
end

Factory.define :landlord do |landlord| 
  landlord.name                 "Sample Landlord"
  landlord.email                "landlord@email.com"
  landlord.website              "www.google.com"
  landlord.phone                "6087903333"
  landlord.city                 "Madison"
  landlord.state                "Wisconsin"
  landlord.address              "18 Lathrop St."
  landlord.zip                  53726
end 

Factory.define :list1 do |list| 
  list.address                    "Sample Default Address"
  list.city                       "Madison"
  list.state                      "Wisconsin"
  list.zip                        53726
  list.rent                       2000
  list.bedrooms                   6
  list.bathrooms                  2
end
