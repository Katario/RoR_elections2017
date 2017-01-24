class Admin::ConnexionsController < ApplicationController
  def index
  end  

  def new
  end

  def create
    admin = Admin.authenticate(params[:login], params[:password])
    if admin
      session[:admin_id] = admin.id
      redirect_to admin_connexions_path action:"index", :notice =>'Logged in!'
    else
      flash.now.alert = "Invalid login or password"
      render "new"
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to action: "new", :notice => "Logged Out !"
  end
end
