class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :create, :edit, :destroy, :update]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :price_per_night, :number_of_guests, :description)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
