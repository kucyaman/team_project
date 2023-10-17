class UsersController < ApplicationController
  
  def new
    @user = User.new
    @user.build_profile
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
      flash[:success]= 'サインアップしました'
    else
      flash.now[:danger] = 'サインアップに失敗しました'
      render :new, status: :unprocessable_entity
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, profile_attributes: [:name])
  end
end
