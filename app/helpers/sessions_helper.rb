module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def valid(user)
    user && user.authenticate(params[:login][:password])
  end

  def log_out
    session[:user_id] = nil
  end

  def logged_in?
    !current_user.nil?
  end
end