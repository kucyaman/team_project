class CurriculumLogsController < ApplicationController
  before_action :set_curriculum_log, only: %i[edit update destroy]

  def new
    @curriculum_log = CurriculumLog.new
    @curriculums = Curriculum.includes(:chapters).all
    @chapters = Chapter.all
  end

  def create
    @curriculum_log = current_user.curriculum_logs.build(curriculum_log_params)

    if @curriculum_log.save
      redirect_to curriculum_logs_path
      flash[:success] = "ログの作成に成功しました"
    else
      flash.now[:danger] = "ログの作成に失敗しました"
      @curriculums = Curriculum.includes(:chapters).all
      @chapters = Chapter.all
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @q = CurriculumLog.includes(:curriculum, :chapter)
    .where(user_id: current_user.id)
    .ransack(params[:q], distinct: true)
    @curriculum_logs = @q.result.page(params[:page]).per(20)
  end

  def edit
    @curriculums = Curriculum.includes(:chapters).all
    @chapters = Chapter.all
  end

  def update
    if @curriculum_log.update(curriculum_log_params)
      redirect_to curriculum_logs_path
      flash[:success] = "ログの編集に成功しました"
    else
      flash.now[:danger] = "ログの編集に失敗しました"
      @curriculums = Curriculum.includes(:chapters).all
      @chapters = Chapter.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @curriculum_log.destroy!
    redirect_to curriculum_logs_path, status: :see_other
    flash[:success] = '削除が完了しました。'
  end

  def capter_change
    selected_curriculum_id = params[:curriculum_id]
    chapters = Chapter.where(curriculum_id: selected_curriculum_id)
    options = chapters.map { |chapter| "<option value='#{chapter.id}'>#{chapter.name}</option>" }.join
    render json: { options: options }
  end

  def curriculum_change
    selected_chapter_id = params[:chapter_id]
    curriculum = Curriculum.includes(:chapters).find_by(chapters: { id: selected_chapter_id })
    render json: { selected_value: curriculum.id }
  end

  private

  def set_curriculum_log
    @curriculum_log = current_user.curriculum_logs.find(params[:id])
  end

  def curriculum_log_params
    params.require(:curriculum_log).permit(:title, :body, :hour, :minutes, :curriculum_id, :chapter_id)
  end
end
