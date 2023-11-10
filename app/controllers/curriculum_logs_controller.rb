class CurriculumLogsController < ApplicationController
  before_action :set_curriculum_log, only: %i[edit update destroy]

  def index
    @q = CurriculumLog.includes(:curriculum)
    .where(user_id: current_user.id)
    .ransack(params[:q], distinct: true)
    @curriculum_logs = @q.result.order(created_at: :desc).page(params[:page]).per(20)
  end

  def new
    @curriculum_log = CurriculumLog.new
    @curriculums = Curriculum.all
    @chapters = Chapter.all
  end

  def edit
    @curriculums = Curriculum.all
    @chapters = Chapter.all
  end

  def create
    @curriculum_log = current_user.curriculum_logs.build(curriculum_log_params)

    if @curriculum_log.save
      redirect_to curriculum_logs_path
      flash[:success] = "ログの作成に成功しました"
    else
      flash.now[:danger] = "ログの作成に失敗しました"
      @curriculums = Curriculum.all
      @chapters = Chapter.all
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @curriculum_log.update(curriculum_log_params)
      redirect_to curriculum_logs_path
      flash[:success] = "ログの編集に成功しました"
    else
      flash.now[:danger] = "ログの編集に失敗しました"
      @curriculums = Curriculum.all
      @chapters = Chapter.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @curriculum_log.destroy!
    redirect_to curriculum_logs_path, status: :see_other
    flash[:success] = '削除が完了しました。'
  end

  def chapter_change
    selected_curriculum_id = params[:curriculum_id]
    chapter = Chapter.includes(:curriculums).find_by(curriculums: { id: selected_curriculum_id })
    render json: { selected_value: chapter.id }
  end

  def curriculum_change
    selected_chapter_id = params[:chapter_id]
    selected_chapter = Chapter.find(selected_chapter_id)
    if selected_chapter.id == 1
      curriculums = Curriculum.all
    else
      curriculums = Curriculum.where(chapter_id: selected_chapter_id)
    end 
    options = curriculums.map { |curriculum| "<option value='#{curriculum.id}'>#{curriculum.name}</option>" }.join
    render json: { options: options }
  end

  private

  def set_curriculum_log
  @curriculum_log = current_user.curriculum_logs.find(params[:id])
   safe= @curriculum_log.body.html_safe
   @curriculum_log.body = safe
  end
  
  def curriculum_log_params
    params.require(:curriculum_log).permit(:title, :body, :hour, :minutes, :curriculum_id)
  end
end
