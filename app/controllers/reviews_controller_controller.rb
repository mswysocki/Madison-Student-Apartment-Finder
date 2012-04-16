class ReviewsControllerController < ApplicationController
  def create
  end

  def update
  end

  def destroy
	@review = Review.find(params[:id])
	@review.destroy
  end

end
