class UsersController < ApplicationController

  before_filter :authenticate_user!, except: [:show, :create]
  after_action :verify_authorized, except: [:show, :create]

  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.friendly.find(params[:id])
     if request.path != user_path(@user)
        redirect_to @user, status: :moved_permanently
      end
  end
  

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def create
    @user = User.new(secure_params)
    respond_to do |format|
      if @user.save
        redirect_to @user, notice: 'User was successfully created.'    
      else
        redirect_to users_path, :alert => "Unable to update user."       
      end
    end
  end


  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:role, :first_name, :last_name, :degree_level, :avatar)
  end


end
