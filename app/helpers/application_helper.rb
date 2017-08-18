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

  def avg_participation(grades)
    ((grades.where(participation: 0).count * 100) + (grades.where(participation: 1).count * 50)) / grades.count(:participation)
  end

  def avg_homework(grades)
    ((grades.where(homework: 0).count * 100) + (grades.where(homework: 1).count * 50)) / grades.count(:homework)
  end
end
