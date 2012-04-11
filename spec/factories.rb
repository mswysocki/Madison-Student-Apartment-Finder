# By using the symbol ':user' we get Factory Girl to simulate the User model
Factory.define :user do |user| 
  user.Name                       "Example Name"
  user.Email                      "email@mail.com"
  user.password                   "password"
  user.password_confirmation      "password"
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
  list.electric                   nil
  list.flags                      nil
  list.gas                        nil
  list.garbagecollection          nil
  list.furnished                  nil
  list.laundry                    nil
  list.parking                    nil
  list.bedrooms                   5
  list.pets                       nil
  list.ltype                      nil
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
