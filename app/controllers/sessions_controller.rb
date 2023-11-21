class SessionsController < ApplicationController

  def create
    # If the user exists AND the password entered is correct.
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Save the user id inside the browser cookie.
      session[:user_id] = user.id
      # redirect_to '/'
      redirect_to root_path
    else
    # If user's login doesn't work, send them back to the lo2gin form.
      redirect_to '/login'
    end
  end

  def destroy
    # session[:user_id] = nil
    session.delete(:user_id)
    redirect_to '/login'
  end
end
