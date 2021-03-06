class SessionsController < ApplicationController

  def new
    respond_to do |format|
      format.html { redirect_to "sessions#new" }
      format.js
    end
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      respond_to do |format|
        format.html do
          redirect_to root_path
        end

        format.js
      end
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
