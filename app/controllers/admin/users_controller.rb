class Admin::UsersController < ApplicationController
  def index
    is_admin_logged
    @users = User.all
  end

  # GET /tours/1
  # GET /tours/1.json
  def show
    is_admin_logged
    @user = User.find(params[:id])

  end

  def new
    is_admin_logged
      @user = User.new
  end

  def create
    is_admin_logged
    @user = User.new(user_params)
    @user.tour1 = 0
    @user.tour2 = 0
    @user.active = 0
    if @user.save
      redirect_to action: "index", :notice => @user.active
    else
      render "new"
    end
  end



  private
      def user_params
        params.require(:user).permit(:name, :forname, :encrypted_code, :postal, :bureau, :tour1, :tour2, :active)
      end

end
