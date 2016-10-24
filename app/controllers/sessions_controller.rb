require 'pry'
class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create

    user = User.find_by(name: params[:user][:name])

    if user 
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "You're logged in. Welcome back!"
    else
      flash[:notice] = "That combination didn't work. Please try again."
      redirect_to signin_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end



end
