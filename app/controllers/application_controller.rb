class ApplicationController < ActionController::Base
  before_action :find_current_user

  def find_current_user
    @current_user = User.find_by({ "id" => session["user_id"] })
  end

  def authenticate_user
    if @current_user.nil?
      flash["notice"] = "You must be logged in."
      redirect_to "/login"
    end
  end
end
