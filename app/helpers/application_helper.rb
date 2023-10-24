module ApplicationHelper
  def total_study_time(user)
    total_hours = user.hours_with_minutes[0]
    total_minutes = user.hours_with_minutes[1]
    
    if total_hours == 0 && total_minutes == 0
      "0時間0分"
    else
      display_study_time(total_hours, total_minutes)
    end
  end

  def remaining_time_to_1000_hours(user)
    total_hours = user.hours_with_minutes[0]
    total_minutes = user.hours_with_minutes[1]
    
    if total_hours * 60 + total_minutes < 1000 * 60
      remaining_minutes = (1000 * 60 - (total_hours * 60 + total_minutes))
      hours_remaining = remaining_minutes / 60
      minutes_remaining = remaining_minutes % 60

      if total_hours == 0 && total_minutes == 0
        "#{hours_remaining}時間"
      else
        "#{hours_remaining}時間#{minutes_remaining}分"
      end
    else
      "おめでとうございます！達成しました！"
    end
  end

  def display_study_time(hours, minutes)
    if hours == 0 && minutes == 0
      "0時間"
    else
      "#{hours}時間#{minutes}分"
    end
  end
end
