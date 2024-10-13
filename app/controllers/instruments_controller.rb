class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_instrument, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

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

  def my_instruments
    @instruments = current_user.instruments
  end

  def edit
  end

  def update
    if @instrument.update(instrument_params)
      redirect_to instrument_path(@instrument), notice: 'Instrument successfully updated!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @instrument.destroy
    redirect_to my_instruments_instruments_path, notice: 'Instrument successfully deleted.'
  end



  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

  def instrument_params
    params.require(:instrument).permit(:name, :description, :address, :price, :category, photos: [])
  end

  def authorize_user!
    redirect_to instruments_path, alert: "You are not authorized to perform this action" unless @instrument.user == current_user
  end

end
