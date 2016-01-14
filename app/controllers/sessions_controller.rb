class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:login][:email])
    if valid(user)
      log_in(user)
      redirect_to links_path
    else
      flash.now[:errors] = "Invalid Login"
      render :new
    end
  end

  def delete
    log_out if logged_in?
    redirect_to root_path
  end
end
