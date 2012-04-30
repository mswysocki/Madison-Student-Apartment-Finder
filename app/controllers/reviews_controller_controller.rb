class ReviewsControllerController < ApplicationController
  def create
	@review = Review.new(params[:list])
	
	respond_to do |format|
      if (@review.valid?)
        @review.save
        format.html { redirect_to(@list, :notice => 'Review was successfully created.') }
        format.xml  { render :xml => @list, :status => :created, :location => @review }
      else
  end

  def update
	@review = Review.find(params[:id])
	
	respond_to do |format|
		if (@review.valid?)
			@review.update_attributes(params[:list])
			format.html { redirect_to(@list, :notice => 'Review was successfully updated.') }
			format.xml  { head :ok }
		else
		
  end

  def destroy
	@review = Review.find(params[:id])
	@review.destroy
  end

end
