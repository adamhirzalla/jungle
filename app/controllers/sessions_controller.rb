class SessionsController < ApplicationController
  def new
  end

  def create
    input = login_params
    user = User.find_by_email(input[:email].downcase)
    if user.nil?
      flash.now[:danger] = 'User not found'
      render :new
    # If the user exists AND the password entered is correct.
    elsif user.authenticate(input[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/', flash: { success: 'Successfully logged in!' }
    else
    # If user's login doesn't work, send them back to the login form.
      flash.now[:danger] = 'Invalid email/password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', flash: { warning: 'User logged out.' }
  end

  private

  def login_params
    params.require(:login).permit(:email, :password)
  end
end
