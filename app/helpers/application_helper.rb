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
  
  
  #currently doesn't work, not being used. 
  def format_phone(phone, mobile=false)
    return phone if format.blank?
    groupings = format.scan(/d+/).map { |g| g.length }
    groupings = [3, 3, 4] unless groupings.length == 3
    ActionController::Base.helpers.number_to_phone(
      phone,
      :area_code => format.index('(') ? true : false,
      :groupings => groupings,
      :delimiter => format.reverse.match(/[^d]/).to_s
    )
  end

  
  include Rack::Recaptcha::Helpers
  
end
