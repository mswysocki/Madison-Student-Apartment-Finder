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
  list.smoking                    true
  list.heat                       true
  list.length                     12
  list.electric                   false
  list.flags                      0
  list.gas                        false
  list.garbagecollection          true
  list.furnished                  true
  list.laundry                    true
  list.parking                    false
  list.bedrooms                   5 
  list.pets                       false
  list.ltype                      true
end
