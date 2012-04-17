class ReviewsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  
  
  def index
    
  end
  
 
  #TODO: Fix what the redirects are in these cases
  def create
    #listing = get_listing()
    @listing = List.find(params[:list_id])
    @review = @listing.reviews.build(params[:review])
    if (@review.save)
      flash[:success] = "Review created!"
      redirect_to @listing #for now..will change
    else 
      flash[:error] = "You suck"
      redirect_to @listing
      #render 'lists/1/show'
    end
  end
	#@review = Review.new(params[:list])
	
#	respond_to do |format|
    #  if (@review.valid?)
   #     @review.save
  #      format.html { redirect_to(@list, :notice => 'Review was successfully created.') }
 #       format.xml  { render :xml => @list, :status => :created, :location => @review }
 #     else
  #      puts;
    #  end
 #   end

  def update
	@review = Review.find(params[:id])
	
	respond_to do |format|
      if (@review.valid?)
	      @review.update_attributes(params[:list])
			  format.html { redirect_to(@list, :notice => 'Review was successfully updated.') }
			  format.xml  { head :ok }
		  else
		    puts;
		  end
    end
  end
		

  def destroy
	@review = Review.find(params[:id])
	@review.destroy
  end

end
