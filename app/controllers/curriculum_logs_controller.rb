class CurriculumLogsController < ApplicationController
  before_action :set_curriculum_log, only: %i[edit update destroy]

  def new
    @curriculum_log = CurriculumLog.new
    @curriculums = Curriculum.all
  end

  def create
    @curriculum_log = current_user.curriculum_logs.build(curriculum_log_params)

    if @curriculum_log.save
      redirect_to curriculum_logs_path
      flash[:success] = "ログの作成に成功しました"
    else
      flash.now[:danger] = "ログの作成に失敗しました"
      @curriculums = Curriculum.all
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @q = CurriculumLog.includes(:curriculum)
    .where(user_id: current_user.id)
    .ransack(params[:q], distinct: true)
    @curriculum_logs = @q.result.order(created_at: :desc).page(params[:page]).per(20)
  end

  def edit
    @curriculums = Curriculum.all
  end

  def update
    if @curriculum_log.update(curriculum_log_params)
      redirect_to curriculum_logs_path
      flash[:success] = "ログの編集に成功しました"
    else
      flash.now[:danger] = "ログの編集に失敗しました"
      @curriculums = Curriculum.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @curriculum_log.destroy!
    redirect_to curriculum_logs_path, status: :see_other
    flash[:success] = '削除が完了しました。'
  end

  private

  def set_curriculum_log
    @curriculum_log = current_user.curriculum_logs.find(params[:id])
  end

  def curriculum_log_params
    params.require(:curriculum_log).permit(:title, :body, :hour, :minutes, :curriculum_id)
  end
end
