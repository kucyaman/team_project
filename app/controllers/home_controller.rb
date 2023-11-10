class HomeController < ApplicationController
  skip_before_action :require_login, only: %i[top]    
  def top
    @everyone_logs = CurriculumLog.includes(:user => :profile).order(created_at: :desc).limit(10)
    this_week_start = Date.today.beginning_of_week
    this_week_end = Date.today.end_of_week
    @user_log_ranks = User.joins(:curriculum_logs).where("curriculum_logs.created_at >= ? AND curriculum_logs.created_at < ?", this_week_start, this_week_end).group("users.id").select("users.id, count(curriculum_logs) as curriculum_logs_count").order("curriculum_logs_count DESC")
    yesterday = Date.yesterday
    @user_study_time = User.joins(:curriculum_logs).where("curriculum_logs.created_at >= ? AND curriculum_logs.created_at < ?", yesterday.beginning_of_day, yesterday.end_of_day).group("users.id").select("users.id, SUM(curriculum_logs.hour * 60 + curriculum_logs.minutes) AS total_study_minutes").order("total_study_minutes DESC")
  end
end
