class UserSessionsController < ApplicationController
    def new; end
  
    def create
      @user = login(params[:email], params[:password])
  
      if @user
        redirect_to curriculum_logs_path
        flash[:success]= 'ログインしました'
      else
        flash.now[:danger] = 'ログインに失敗しました'
        render :new, status: :unprocessable_entity
      end
    end
  
    def destroy
      logout
      redirect_to login_path, status: :see_other
      flash[:success] = "ログアウトしました"
    end
end
