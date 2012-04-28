class LandlordsController < ApplicationController
  
  def new
    
  end
  
  def index
    @title = "All landlords"
    @landlords = Landlord.paginate(:page => params[:page])
  end
  
  def show
    @landlord = Landlord.find(params[:id])
    @title = @landlord.name
    @listings = get_listings(@landlord).paginate(:page => params[:page])
  end
  
  
  
  
  private
    def get_listings(landlord) 
      @lists = List.where("landlord_id = ?", landlord.id)
      return @lists
    end
end
