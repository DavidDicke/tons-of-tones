class InstrumentsController < ApplicationController
  # This ensures that users are logged in for actions that modify data
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @instruments = Instrument.all
  end

  def show
    @instrument = Instrument.find(params[:id])
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
      render :new, alert: 'There was an issue creating your instrument listing.'
    end
  end


  private

  def instrument_params
    params.require(:instrument).permit(:name, :description, :capacity, :address, :price, :category)
  end

end
