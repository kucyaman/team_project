class CurriculumLogsController < ApplicationController
  before_action :set_curriculum_log, only: %i[edit update destroy]

  def new
    @curriculum_log = CurriculumLog.new
    @chapter = Curriculum.includes(:chapters).all
  end

  def create
    @curriculum_log = current_user.curriculum_logs.build(curriculum_log_params)

    if @curriculum_log.save
      redirect_to curriculum_logs_path, notice: "ログの作成に成功しました"
    else
      flash.now[:danger] = "ログの作成に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @curriculum_logs = CurriculumLog.includes(:curriculum, :chapter).where(user_id: current_user.id).page(params[:page]).per(20)
  end

  def edit;end

  def update
    if @curriculum_log.update(curriculum_log_params)
      redirect_to curriculum_logs_path, success: 'ログの編集に成功しました'
    else
      flash.now[:danger] = 'ログの編集に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @curriculum_log.destroy!
    redirect_to curriculum_logs_path, success: 'ログを削除しました'
  end

  private

  def set_curriculum_log
    @curriculum_log = current_user.curriculum_logs.find(params[:id])
  end

  def curriculum_log_params
    params.require(:curriculum_log).permit(:title, :body, :hour, :minutes, :curriculum_id, :chapter_id)
  end
end
