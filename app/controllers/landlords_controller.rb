class LandlordsController < ApplicationController
  
  def new
    
  end
  
  def index
    @title = "All landlords"
    @landlords = Landlord.paginate(:page => params[:page])
  end
end
