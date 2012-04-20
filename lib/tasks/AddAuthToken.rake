task :AddAuthToken => :environment do
  users_to_update = User.all
  users_to_update.each do |user|
    user.generate_token(:auth_token)
  end
end