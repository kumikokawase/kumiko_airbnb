class PropertiesController < ApplicationController
  before_action :only_loggedin_users, only: [:create, :destroy]

  def new
    @properties = current_user.properties.build
  end

  def create
    @properties = current_user.properties.build(property_params)
    if @properties.save
      redirect_to @properties
      flash[:success] = "Successfully saved!"
    else
      redirect_to root_url
      flash[:danger] = "Invalid"
    end
  end

  def update 
    @properties = Property.find(params[:id])    
    begin
      if @properties.update(property_params)
        flash[:notice] = "Saved..."
      else
        flash[:alert] = "Something went wrong..."
      end
      redirect_to request.referrer
    end
  end

  def listing
    @properties = Property.find(params[:id])
  end

  def pricing
    @properties = Property.find(params[:id]) 
  end

  def description
    @properties = Property.find(params[:id]) 
  end

  def amenities
    @properties = Property.find(params[:id]) 
    @amenities = @properties
  end

  def location
    @properties = Property.find(params[:id]) 
  end

  def index
  end

  private
  def property_params
    params.require(:property).permit(:home_type, :room_type, :guest_count, :bedroom_count, :bathroom_count, :price, :title, :description, :location, :has_tv, :has_heater, :has_aircon, :has_kitchen, :has_will )
  end
end
