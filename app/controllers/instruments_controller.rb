class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @instruments = Instrument.all
    filter_search
    filter_dates
    filter_categories
    set_dates
  end

  def show
    @instrument = Instrument.find(params[:id])
    @booking = Booking.new
    @booking.start_date = params[:start_date] if params[:start_date]
    @booking.end_date = params[:end_date] if params[:end_date]
    @booking.user_id = current_user.id if current_user.present?

    # Add marker for map:
    @markers = [{
    lat: @instrument.latitude,
    lng: @instrument.longitude
  }]
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
      redirect_to user_path(current_user), notice: 'Instrument successfully deleted.'
    else
      redirect_to user_path(current_user), alert: 'Unable to delete the instrument.'
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
    end
    if params[:end_date]
      @end_date = params[:end_date]
    end
  end

  def filter_dates
    if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      # range_b.begin <= range_a.end && range_a.begin <= range_b.end
      selected_instruments = @instruments.select do |instrument|
        instrument.bookings.count do |booking|
          booking.start_date <= end_date && booking.end_date >= start_date && booking.status != 3
        end.zero?
      end
      @instruments = selected_instruments
      # sql_query = "end_date < :start_date OR start_date > :end_date"
      # @instruments.joins(:bookings).where(sql_query, start_date: params[:start_date], end_date: params[:end_date])
    end
  end

  def filter_categories
    if params[:category].present?
      @instruments = Instrument.where("category = ?", params[:category])
    end
  end

  def filter_search
    if params[:query].present?
      sql_query = "name @@ :query OR description @@ :query OR category @@ :query"
      @instruments = Instrument.where(sql_query, query: "%#{params[:query]}%")
    end
  end

  def instrument_params
    params.require(:instrument).permit(:name, :description, :address, :price, :category, photos: [])
  end

  def authorize_user!
    redirect_to instruments_path, alert: "You are not authorized to perform this action" unless @instrument.user == current_user
  end

end
