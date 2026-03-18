class EntriesController < ApplicationController
  before_action :authenticate_user

  def new
    @place = Place.find_by({ "id" => params["place_id"], "user_id" => @current_user.id })
    if @place.nil?
      flash["notice"] = "Place not found."
      redirect_to "/places"
    end
  end

  def create
    @place = Place.find_by({ "id" => params["place_id"], "user_id" => @current_user.id })
    if @place
      @entry = Entry.new
      @entry["title"] = params["title"]
      @entry["description"] = params["description"]
      @entry["occurred_on"] = params["occurred_on"]
      @entry["place_id"] = @place["id"]
      @entry["user_id"] = @current_user.id
      @entry.save
      redirect_to "/places/#{@entry["place_id"]}"
    else
      flash["notice"] = "Place not found."
      redirect_to "/places"
    end
  end

end
