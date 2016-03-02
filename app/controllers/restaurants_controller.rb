class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [ :edit, :show, :update, :destroy ]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirection
    else
      render :new
    end
  end

  def edit
    @restaurant
  end

  def update
    @restaurant.update!(restaurant_params)
    redirection
  end

  def destroy
    @restaurant.destroy!
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:description, :name, :address, :stars, :phone_number, :category)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def redirection
    redirect_to restaurant_path(@restaurant)
  end

end
