class UsersController < ApplicationController
  before_action :only_loggedin_users,
  only: [:index, :edit, :update]

  def index
    @user =User.all
  end

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
      redirect_to login_url
    else
      flash[:danger] = "Invalid content. Try again."
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Saved successfully!"
      redirect_to @user
    else
      flash[:danger] = "Invalid content. Try again."
      render 'edit'
    end
  end  

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def only_loggedin_users
  redirect_to login_url unless logged_in?
  end
  
  def corrent_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless
    current_user?(@user)
  end

end



