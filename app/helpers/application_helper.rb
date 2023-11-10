module ApplicationHelper
  def daily_study_time(user)
    today = Time.zone.today
    curriculum_logs = user.curriculum_logs.where('DATE(created_at) = ?', today)

    total_minutes = curriculum_logs.sum { |log| (log.hour * 60) + log.minutes }
    hours = total_minutes / 60
    minutes = total_minutes % 60

    display_study_time(hours, minutes)
  end
  
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
    
    if (total_hours * 60) + total_minutes < 1000 * 60
      remaining_minutes = ((1000 * 60) - ((total_hours * 60) + total_minutes))
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
    elsif hours == 0
      "#{minutes}分"
    else
      "#{hours}時間#{minutes}分"
    end
  end

  def count_logs_today(user)
    today = Time.zone.today
    curriculum_logs = user.curriculum_logs.where('DATE(created_at) = ?', today)
    curriculum_logs.count
  end

  def default_meta_tags
    {
      site: 'Loguma',
      title: 'Loguma',
      reverse: true,
      charset: 'utf-8',
      description: 'Logumaで、ログをつける。身につける。',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('Loguma.jpeg'),
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary',
        image: image_url('Loguma_x.jpeg')
      }
    }
  end
end
