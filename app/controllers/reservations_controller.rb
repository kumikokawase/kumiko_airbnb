class ReservationsController < ApplicationController


  def edit
  end

  def show
  end

  def index
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
      if @reservation.save
        flash[:success] = "Succesfully Booked!"       
      end
    redirect_to properties_path
  end

  def your_reservations
    @property_ids = current_user.properties.pluck(:id)
    @reservations = Reservation.where(property_id: @property_ids)
    @review = Review.new
  end

  def your_trips
    @property_ids = current_user.properties.pluck(:id)
    @reservations = Reservation.where(property_id: @property_ids)
    @review = Review.new
  end

  private
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :property_id)
    end
end
