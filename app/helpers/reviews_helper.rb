module ReviewsHelper
  
  #gets the user associated with the given user id
  def get_user(user_id)
    if user_id.nil? 
      return
    end
    
    user = User.find(user_id)
    return user
  end 
end
