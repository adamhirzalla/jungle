class UsersController < ApplicationController
  def new
  end

  def create
    input = user_params
    # downcasing registered email (emails are case insensitive)
    # and getting rid of spaces in email 
    p input[:email]
    input[:email].split.first.downcase! unless input[:email].empty?
    user = User.new(input)

    if user.save
      session[:user_id] = user.id
      redirect_to '/', flash: { success: 'User successfully created!' }
    else
      flash.now[:danger] = user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
