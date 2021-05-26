class ReservationsController < ApplicationController


  def edit
  end

  def show
  end

  def index
  end

  def create
    @room = Property.find(params[:property_id])
    @reservation = current_user.reservations.build(reservation_params)
    if current_user == @room.user
      flash[:alert] = "You can not book your own property"
    else
      if @reservation.save || reservations.any?
        flash[:success] = "Succesfully Booked!"       
      end 
    end 
  end

  def your_reservations
  end

  private
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :property_id)
    end

end
