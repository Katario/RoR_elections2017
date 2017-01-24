class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:name], params[:encrypted_code])
    if user
      user.active = 1
      user.save
      session[:user_id] = user.id
      redirect_to action: "new", :notice =>'Logged in!'
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to action: "new", :notice => "Logged Out"
  end



end
