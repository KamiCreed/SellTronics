class SessionsController < ApplicationController
  def new
  end

  def create
    person = Person.find_by(email: params[:session][:email].downcase)
    if person && person.authenticate(params[:session][:password])
      log_in person
      redirect_back_or person
    else
      # Throw error message
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
