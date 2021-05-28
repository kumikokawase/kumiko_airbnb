class ReviewsController < ApplicationController

  def create
    @host_params = Review.create(review_params)
    redirect_to request.referrer
  end

  def destroy
    @review = Review.find(params[:id]).destroy
    redirect_to request.referrer
    flash[:success] = "Removed..."
  end


   private
    def review_params
      params.require(:review).permit(:comment, :reservation_id)
    end
end
