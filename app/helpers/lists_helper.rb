module ListsHelper
  
  
  def get_landlord(landlord_id) 
    return Landlord.find(landlord_id)
  end
  
  
  #increments the count of the 'flag' counter of a given list.
  #BUG: Currently, it updates after a page load, which can be kind of annoying..this means that it needs to stay away from the regular users
  def increment_flag list
    if (params[:commit] != "Flag")
      return
    end
        
    if list.nil? || list.flags.nil?
      return
    end
    
    list.flags += 1
    list.save!
    return
  end
  
  
  def format_restrictions(util)
    to_ret = ""
   
    util.each { |key, value| 
      if (value.nil?)
        return
      end
      
      if (value == false)
        to_ret = "No " << key.downcase
      else
        to_ret = key.downcase
      end
      
      to_ret << " allowed."
      #to_ret = no_or_nil(value) << key 
      #to_ret << key << " is " << to_readable(value);  
    }
    return to_ret
  end
  
  def format_accomodations(acc)
    acc.each { |key, value| 
      if (key == "Parking" || key == "Laundry")
        if (!value)
          return "No " << key.downcase << " on-site."
          #return to_ret
        else
          return "" << key << " available on-site."
        end
      else  #furnished
        if (value)
          return "Furnished."
        else 
          return "Not furnished."
        end
      end
    }
    
  end
  
  
  def format_util(util) 
    if (util)
      return "included in the rent."
    end
    return "not included in the rent."
  end
  
  def format_type(type) 
    if (type)
      return "House"
    else
      return "Apartment"
    end
  end
  
  #No longer used, but may be later
  def to_readable(bool)
    if bool == true
      return "allowed."
    else 
      return "not allowed."
    end
  end
  
 
  
  private
end
