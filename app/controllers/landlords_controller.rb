class LandlordsController < ApplicationController
  
  def new
    @landlord = Landlord.new
    @title = "New landlord"
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
  
  
  def create
    @landlord = Landlord.new(params[:landlord])
    if @landlord.save
      flash[:success] = "Landlord created."
      redirect_to all_landlords_path
    else
      @title = "New Landlord"
      render 'new'
    end
    
  end
  
  
  
  
  private
    def get_listings(landlord) 
      @lists = List.where("landlord_id = ?", landlord.id)
      return @lists
    end
end
