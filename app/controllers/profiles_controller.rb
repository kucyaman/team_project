class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def show; end

  def new
    @profile = Profile.new
  end

  def edit; end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save  
      redirect_to profile_path
      flash[:success]= 'プロフィールが作成されました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path
      flash[:success]= 'プロフィールが更新されました'
    else
      flash.now[:danger] = 'プロフィールの編集に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:name, :language, :introduction, :avatar, :avatar_cache,:hour, :minutes)
  end

  def set_user
    @user = current_user
  end
end
