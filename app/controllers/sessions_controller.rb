class SessionsController < ApplicationController
  def new
    if @current_user
      redirect_to "/places"
    end
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if @user.authenticate(params["password"])
        session["user_id"] = @user.id
        flash["notice"] = "You've logged in."
        redirect_to "/places"
      else
        flash["notice"] = "Incorrect password."
        redirect_to "/login"
      end
    else
      flash["notice"] = "User not found."
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
