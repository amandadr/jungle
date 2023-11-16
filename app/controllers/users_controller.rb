class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # If user saves in the db successfully:
      session[:user_id] = @user.id
      redirect_to '/', notice: 'User created!'
    else
      # If user fails model validation - probably a bad password or duplicate email:
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstName, :surname, :email, :password_digest)
  end
end
