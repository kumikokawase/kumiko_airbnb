class PropertiesController < ApplicationController
  before_action :only_loggedin_users, only: [:create, :destroy]

  def new
    @properties = current_user.properties.build
  end

  def create
    @properties = current_user.properties.build(property_params)
    if @properties.save
      flash[:success] = "Successfully saved!"
      redirect_to
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

  def picture
    @properties = Property.find(params[:id]) 
    @photos = @properties.photos
    @photo = Photo.new
  end

  def amenities
    @properties = Property.find(params[:id]) 
  end

  def location
    @properties = Property.find(params[:id]) 
  end

  def has_tv
    @properties = Property.find(params[:id])
  end

  def has_heater
    @properties = Property.find(params[:id])
  end

  def has_aircon
    @properties = Property.find(params[:id])
  end

  def has_kitchen
    @properties = Property.find(params[:id])
  end

  def has_will
    @properties = Property.find(params[:id])
  end

  def index
  end

  def show
    @properties = Property.find(params[:id])
    @reservation = Reservation.new
  end

  private
  def property_params
    params.require(:property).permit(:home_type, :room_type, :guest_count, :bedroom_count, :bathroom_count, 
    :price, :title, :description, :has_tv, :has_heater, :has_aircon, :has_kitchen, :has_will, :location )
  end

end
