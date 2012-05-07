class LandlordsController < ApplicationController
  
  # GET /landlords/new
  def new
    session[:return_to] = request.referer
    @landlord = Landlord.new
    @title = "New landlord"
  end
  
  # GET /landlords
  def index
    @title = "All landlords"
    @landlords = Landlord.paginate(:page => params[:page], :per_page => 10)
  end
  
  
  # GET /landlords/1
  def show
    @landlord = Landlord.find(params[:id])
    @title = @landlord.name
    @listings = get_listings(@landlord).paginate(:page => params[:page])
  end
  
  # POST /landlords
  def create
    @landlord = Landlord.new(params[:landlord])
    if @landlord.save
      flash[:success] = "Landlord created."
      redirect_to session[:return_to]    #redirect to where they came from before this page
    else
      @title = "New Landlord"
      render 'new'
    end
  end
  
  # DELETE /landlords/1
  def destroy 
    session[:return_to] = request.referer
    Landlord.find(params[:id]).destroy
    #flash[:success] = "User destroyed."
    #redirect_to users_path
    redirect_to session[:return_to]
  end
  
  
  
  
  private
    def get_listings(landlord) 
      @lists = List.where("landlord_id = ?", landlord.id)
      return @lists
    end
end
