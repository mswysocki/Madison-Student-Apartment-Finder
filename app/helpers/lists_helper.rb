module ListsHelper
  
  #returns if an element is nil. 
  #Not useful in current state, as it is not even any shorter
  def is_nil(element)
    if element.nil?
      return true
    else 
      return false
    end
  end
  
  
  #increments the count of the 'flag' counter of a given list.
  #BUG: Currently, it updates after a page load, which can be kind of annoying..this means that it needs to stay away from the regular users
  def increment_flag list
    if (params[:commit] != "Flag")
      return
    end
        
    if list.nil?
      return
    end
    
    list.flags += 1
    list.save!
    return
  end
  
  
end
