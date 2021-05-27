class ReviewsController < ApplicationController
  # before_action :only_loggedin_users, only: [:create, :destroy]

  # def index
  #   @host_params = Review.new
  #   @guest_params = Review.new
  # end

  def create
    @host_params = current_user.reviews.build(review_params)
    @guest_params = current_user.reviews.build(review_params)

     if @host_params.save or @guest_params.save
      flash[:success] = "Review created"
    else
      flash[:alert] = "Something went wrong... "
    end
    redirect_to request.referrer
  end

  def destroy
    @review = Review.find(params[:id]).destroy
    redirect_to request.referrer
    flash[:success] = "Removed..."
  end


   private
    def review_params
      params.require(:review).permit(:comment, :star_rating, :reservation_id)
    end
end
