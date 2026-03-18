class PlacesController < ApplicationController
  before_action :authenticate_user

  def index
    @places = Place.where({ "user_id" => @current_user.id })
  end

  def show
    @place = Place.find_by({ "id" => params["id"], "user_id" => @current_user.id })
    if @place
      @entries = Entry.where({ "place_id" => @place["id"], "user_id" => @current_user.id })
    else
      flash["notice"] = "Place not found."
      redirect_to "/places"
    end
  end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place["user_id"] = @current_user.id
    @place.save
    redirect_to "/places"
  end

end
