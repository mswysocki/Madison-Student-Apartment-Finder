# By using the symbol ':user' we get Factory Girl to simulate the User model
Factory.define :user do |user| 
  user.Name                       "Example Name"
  user.Email                      "email@mail.com"
  user.password                   "password"
  user.password_confirmation      "password"
end
