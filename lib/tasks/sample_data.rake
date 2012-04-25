namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Example User",:email => "a@a.com", :password => "password", :password_confirmation => "password")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@example.com"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
   
   # Was planning on adding a way to populate the db with sample comments, but
            #am giving up the idea for now 
   #5.times do |n| 
   #  Listing.all(:limit => 25).each do |listing|
   #    @review = 
   #  end
   #end
  end
end