class UsersController < ApplicationController

    def home
    end

    def new
      if logged_in?
        redirect_to user_path(current_user)
      end
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to new_user_path
      end
    end


    def index
    end

    def show
      if logged_in?
        @user = User.find_by_id(session[:user_id])
        params[:message] ? @message = params[:message] : @message = nil
      else
        redirect_to root_path
      end
    end

private

  def user_params
    params.require(:user).permit(:height, :name, :email, :password, :nausea, :admin, :happiness, :tickets, :password_confirmation)
  end
end
