class ReservationController < ApplicationController
  def create
    @property = Property.find(params[:property_id])
    @reservation = current_user.reservations.build(reservation_params)
    if current_user == @property.user
      flash[:alert] = "You can not book your own property"
    else
      if @reservation.save || reservations.any?
        flash[:success] = "Succesfully Booked!"       
      end 
    end
    redirect_to @property
  end

  def edit
  end

  def show
  end

  def your_reservations
  end

  private
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :property_id)
    end
end
