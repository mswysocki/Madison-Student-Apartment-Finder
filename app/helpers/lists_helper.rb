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
  
  
end
