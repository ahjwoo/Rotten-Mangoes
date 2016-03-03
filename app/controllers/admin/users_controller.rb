class Admin::UsersController < ApplicationController
  before_filter :only_for_admins

  def index
    @users = User.order(:id).page(params[:page]).per(10)
    @user = User.new
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(admin_user_params)

    if @user.save
      flash[:notice] = "User #{@user.full_name} created!"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(admin_user_params)
      flash[:notice] = "Successfully updated User."
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to admin_users_path
    end
  end   


  protected

  def admin_user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end
end
