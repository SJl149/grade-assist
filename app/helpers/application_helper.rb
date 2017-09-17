module ApplicationHelper

  def gravatar_url(email, size)
    gravatar = Digest::MD5::hexdigest(email).downcase
    url = "http://gravatar.com/avatar/#{gravatar}.png?s=#{size}&d=retro"
  end

  def attendance_label(grade)
    case grade
    when 'present' then "success"
    when 'late' then "warning"
    else "danger"
    end
  end

  def participation_label(grade)
    case grade
    when 'good' then "success"
    when 'avg' then "warning"
    else "danger"
    end
  end

  def homework_label(grade)
    case grade
    when 'full' then "success"
    when 'half' then "warning"
    else "danger"
    end
  end

  def semester_panel_label(semester, current_course)
    if semester.name == current_course.name
      "info"
    else
      "default"
    end
  end

  def avg_participation(grades)
    total = grades.count(:participation)
    if total == 0
      return 0
    else
      ((grades.where(participation: 0).count * 100) + (grades.where(participation: 1).count * 50)) / total
    end
  end

  def avg_homework(grades)
    total = grades.count(:homework)
    if total == 0
      return 0
    else
      ((grades.where(homework: 0).count * 100) + (grades.where(homework: 1).count * 50)) / total
    end
  end
end
