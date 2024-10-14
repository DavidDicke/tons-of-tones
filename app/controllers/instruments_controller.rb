class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @instruments = Instrument.all
  end

  def show
    @instrument = Instrument.find(params[:id])
    @booking = Booking.new
    @booking.user_id = current_user.id if current_user.present?
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user

    if @instrument.save
      redirect_to instrument_path(@instrument), notice: 'Instrument successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def instrument_params
    params.require(:instrument).permit(:name, :description, :address, :price, :category, photos: [])
  end

end
