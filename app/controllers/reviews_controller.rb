class ReviewsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy
  
  def new
    @review = Review.new
  end
  def index
    @reviews = Review.all
  end
  
  def show
    
  end
 
  #TODO: Fix what the redirects are in these cases
  def create
    @listing = List.find(params[:list_id])
    #@user = current_user
    @review = current_user.reviews.build(params[:review])
    @review.list_id = @listing.id
    #@review = @listing.reviews.build(params[:review])
    #@review.update_attributes(:user_id => @user)
    
    respond_to do |format|
      if (@review.save)
        format.html { redirect_to(@listing) } #, :notice => 'Your review was successfully added.') }
        format.xml  { render :xml => @listing, :status => :created, :location => @listing }
        #format.html { redirect_to(@listing, :notice => 'Review was successfully created.') }
        #format.xml  { render :xml => @listing, :status => :created, :location => @listing }
        #redirect_to @listing
      else 
        format.html { redirect_to(@listing) } #, :notice => 'Your review was not added.') }
        format.xml  { render :xml => @review.errors, :status => :unprocessable_entity }
        #flash[:error] = "The review could not be created because there were some errors.........."
        #redirect_to @listing
      end
    end
  end
	
  #Editing not implemented...mostly because I don't know how to do it
  #def update
  #	@review = Review.find(params[:id])
  #	
  #	respond_to do |format|
  #	  if (@review.valid?)
  #	    @review.update_attributes(params[:list])
  #		  format.html { redirect_to(@list, :notice => 'Review was successfully updated.') }
  #			format.xml  { head :ok }
  #		else
  #		  puts;
  #		end
  #  end
  #end

  def destroy
    session[:return_to] = request.referer
    @listing = List.find(Review.find(params[:id]).list_id)
    @review.destroy
    #redirect_back_or @listing
    redirect_to session[:return_to]
  end
  
  
  private

    def authorized_user
      @review = current_user.reviews.find_by_id(params[:id])
      if admin?
        @review = Review.find(params[:id])
      end
      
      redirect_to home_page_path if @review.nil? 
    end

end
