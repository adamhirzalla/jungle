class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate_with_credentials(
      login_params[:email], 
      login_params[:password]
    )
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/', flash: { success: 'Successfully logged in!' }
    else
    # If user is not authenticated, send them back to the login form.
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
