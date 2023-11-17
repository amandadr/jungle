class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      # If user fails model validation - probably a bad password or duplicate email:
      flash[:notice] = @user.errors.full_messages.to_sentence
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstName, :surname, :email, :password, :password_confirmation)
  end
end
