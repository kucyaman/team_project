class OauthsController < ApplicationController
  skip_before_action :require_login, raise: false

  def oauth
    return redirect_to root_path, info: t('defaults.info') if logged_in?
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    begin
      if @user = login_from(provider)
        redirect_to curriculum_logs_path, success: "#{provider.titleize}アカウントでログインしました。"
      else
        begin
          @user = create_from(provider)
          @profile = Profile.create(user_id: @user.id, name: @user.remote_name)
          reset_session
          auto_login(@user)
          redirect_to curriculum_logs_path, success: "#{provider.titleize}アカウントでログインしました。"
        rescue => e
          redirect_to login_path
          flash[:danger] = "#{provider.titleize}アカウントでのログインに失敗しました。#{e}"
        end
      end
    end
  end
end