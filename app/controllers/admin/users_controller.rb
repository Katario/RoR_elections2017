class Admin::UsersController < ApplicationController
  def new
      @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to action: "new", :notice => "Signed Up"
    else
      render "new"
    end
  end

  private
      def user_params
        params.require(:user).permit(:name, :forname, :encrypted_code, :postal, :bureau, :tour1, :tour2, :active)
      end

end
