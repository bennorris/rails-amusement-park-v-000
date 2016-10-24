class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attractions_params)

    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to new_attraction_path
    end
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @user = current_user
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update

    @attraction = Attraction.find_by_id(params[:id])
    if @attraction.update(attractions_params)
      redirect_to attraction_path(@attraction)
    else
      redirect_to edit_attraction_path
    end
  end


private

  def attractions_params
    params.require(:attraction).permit(:name, :tickets, :happiness_rating, :nausea_rating, :min_height)
  end

end
