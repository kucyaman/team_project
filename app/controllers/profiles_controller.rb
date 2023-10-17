class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
      redirect_to profile_path, success: 'プロフィールが作成されました'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, success: 'プロフィールが更新されました'
    else
      render :edit
    end
  end


  private

  def set_profile
    @profile = Profile.find(current_user.id)
  end

  def profile_params
    params.require(:profile).permit(:name, :language, :introduction, :avatar, :avatar_cache)
  end

  def set_user
    @user = current_user
  end
end
