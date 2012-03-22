module ApplicationHelper
  #return a title on a per-page basis
    #this could be used to make our titles in the future..with an append
  def full_title
    base_title = "Madison Student Housing Finder";
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title} "
    end
  end
  
  #Unused helper function
  def sortable(column, title = nil)
    title ||= column.titleize
    #css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
  end
end
