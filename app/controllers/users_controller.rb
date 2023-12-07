class UsersController < ApplicationController
  def index
    # placeholder for index logic
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    flash[:alert] = 'User not found' if @user.nil?
  end
end
