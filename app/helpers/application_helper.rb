module ApplicationHelper
  #return a title on a per-page basis
  def full_title
    base_title = "Madison Student Housing Finder";
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title} "
    end
  end
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end
  
  def set_listing(listing)
    @current_listing = listing 
    return @current_listing
  end
  
  
  include Rack::Recaptcha::Helpers
  
end
