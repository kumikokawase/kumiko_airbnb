class PropertiesController < ApplicationController
  before_action :only_loggedin_users, only: [:create, :destroy]

  def new
    @properties = current_user.properties.build
  end

  def create
    @properties = current_user.properties.build(property_params)
    if @properties.save
      redirect_to root_url
      flash[:success] = "Successfully saved!"
    else
      redirect_to root_url
      flash[:danger] = "Invalid"
    end
  end

  def edit
  end

  def show
    @properties = Property.find(params[:id])
  end

  def index
  end

  private
  def property_params
    params.require(:property).permit(:home_type, :room_type, :guest_count, :bedroom_count, :bathroom_count)
  end
end
