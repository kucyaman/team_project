class OauthsController < ApplicationController
  skip_before_action :require_login, raise: false

  def oauth
    return redirect_to root_path, info: t('defaults.info') if logged_in?
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    begin
      @user = login_from(provider)
      if @user
        redirect_to curriculum_logs_path, success: "#{provider.titleize}アカウントでログインしました。"
      else
        @user = create_from(provider)
        @profile = Profile.create(user_id: @user.id, name: @user.remote_name)
        reset_session
        auto_login(@user)
        redirect_to curriculum_logs_path, success: "#{provider.titleize}アカウントでログインしました。"
      end
    rescue
      redirect_to login_path
      flash[:danger] = "#{provider.titleize}アカウントでのログインに失敗しました。"
    end
  end
end