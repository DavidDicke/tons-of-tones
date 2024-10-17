class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:category]
      @instruments = Instrument.where("category = ?", params[:category])
    else
      @instruments = Instrument.all
    end
    set_dates
  end

  def show
    @instrument = Instrument.find(params[:id])
    @booking = Booking.new
    @booking.start_date = params[:start_date] if params[:start_date]
    @booking.end_date = params[:end_date] if params[:end_date]
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
    @instruments = Instrument.where(user: current_user)
  end

  def edit
    @instrument = Instrument.find(params[:id])
  end

  def update
    @instrument = Instrument.find(params[:id])
    if @instrument.update(instrument_params)
      redirect_to instrument_path(@instrument), notice: 'Instrument successfully updated!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    if @instrument.destroy
      redirect_to my_instruments_instruments_path, notice: 'Instrument successfully deleted.'
    else
      redirect_to instrument_path(@instrument), alert: 'Unable to delete the instrument.'
    end
  end

  private

  def set_instrument
    if params[:id] == 'my_instruments'
      redirect_to my_instruments_path and return
    else
      @instrument = Instrument.find(params[:id])
    end
  end

  def set_dates
    if params[:start_date]
      @start_date = params[:start_date]
    else
      @start_date = Date.today
    end
    if params[:end_date]
      @end_date = params[:end_date]
    else
      @end_date = Date.today + 1
    end
  end


  def instrument_params
    params.require(:instrument).permit(:name, :description, :address, :price, :category, photos: [])
  end

  def authorize_user!
    redirect_to instruments_path, alert: "You are not authorized to perform this action" unless @instrument.user == current_user
  end

end
