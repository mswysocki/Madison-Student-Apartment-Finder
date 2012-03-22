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
end
