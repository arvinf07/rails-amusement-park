class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show 
    @attraction = Attraction.find_by_id(params[:id])
  end

  def ride
    @attraction = Attraction.find_by_id(params[:id])
    ride = Ride.create(user: current_user, attraction: @attraction)
    ##Try passing the message in the session
    session[:message] = ride.take_ride
    redirect_to user_path(current_user)
  end

  def new
    @attraction = Attraction.new
  end  

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render 'new'  
    end
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
    @attraction = Attraction.find_by_id(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end



  private
  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end  

end
