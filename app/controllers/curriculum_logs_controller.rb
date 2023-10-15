class CurriculumLogsController < ApplicationController
  def new
  end

  def index
    @curriculum_logs = CurriculumLog.includes(:curriculum, :chapter).where(user_id: current_user.id)
  end

  def edit
  end
end
