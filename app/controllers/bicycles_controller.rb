class BicyclesController < ApplicationController
before_action :set_bike, only: [:show, :edit, :update, :destroy]

  def index
    @bicycles = Bicycle.all
  end

  def show
  end

  def new
    @bicycle = Bicycle.new
  end

  def edit
  end

  def create
    @bicycle = Bicycle.new(bicycle_params)
    if @bicycle.save
      redirect_to @bicycle, notice: 'Bike was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @bicycle.update(bicycle_params)
      redirect_to @bicycle, notice: 'Bike was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @bicycle.destroy
    redirect_to bicycles_path
  end

  private
    def set_bike
      @bicycle = Bicycle.find(params[:id])
    end

    def bicycle_params
      params.require(:bicycle).permit(:name, :description, :image)
    end
end
