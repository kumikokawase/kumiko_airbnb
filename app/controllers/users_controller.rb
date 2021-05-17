class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Saved successfully!"   
      redirect_to @user
    else
      flash[:danger] = "Invalid content. Try again."
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end



