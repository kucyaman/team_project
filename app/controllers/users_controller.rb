class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
    @user.build_profile
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(user_params[:email], user_params[:password])
      redirect_to curriculum_logs_path
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
