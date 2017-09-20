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
    when 66..100 then "success"
    when 34..65 then "warning"
    else "danger"
    end
  end

  def homework_label(grade)
    case grade
    when 80..100 then "success"
    when 60..79 then "warning"
    else "danger"
    end
  end

end
