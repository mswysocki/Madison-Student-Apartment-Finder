task :AddAuthToken => :environment do
  users_to_update = User.all
  users_to_update.each do |user|
      user.update_attributes(:password => 'password', :password_confirmation => 'password', :auth_token => SecureRandom.urlsafe_base64)
  end
end