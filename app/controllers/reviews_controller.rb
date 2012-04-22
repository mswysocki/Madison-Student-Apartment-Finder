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
    #listing = get_listing()
    @listing = List.find(params[:list_id])
    #@user = current_user
    @review = current_user.reviews.build(params[:review])
    @review.list_id = @listing.id
    #@review = @listing.reviews.build(params[:review])
    #@review.update_attributes(:user_id => @user)
    
    if (@review.save)
      flash[:success] = "Review created!"
      #format.html { redirect_to(@listing, :notice => 'Review was successfully created.') }
      #format.xml  { render :xml => @listing, :status => :created, :location => @listing }
      redirect_to @listing
    else 
      flash[:error] = "The review could not be created because there were some errors.........."
      puts @review.errors
      redirect_to @listing
      #render 'lists/1/show'
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
	def user_destroy
	  @user = User.find(Review.find(params[:id]).user_id)
    @review.destroy
    redirect_back_or @user
	end

  def destroy
    puts params
    @listing = List.find(Review.find(params[:id]).list_id)
    @review.destroy
    redirect_back_or @listing
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
