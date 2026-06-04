class UsersController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def show
  end
  
  def edit
    authorize! :update, @user
  end
  
  def update
    authorize! :update, @user
    if @user.update(user_params)
      redirect_to users_path, notice: "Usuario actualizado"
    else
      render :edit
    end
  end
  
  def destroy
    authorize! :destroy, @user
    @user.destroy
    redirect_to users_path, notice: "Usuario eliminado"
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def authorize_admin!
    unless current_user.role == 1
      redirect_to root_path, alert: "No autorizado"
    end
  end
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :role)
  end
end