module ApplicationHelper

  def gravatar_url(email, size)
    gravatar = Digest::MD5::hexdigest(email).downcase
    url = "http://gravatar.com/avatar/#{gravatar}.png?s=#{size}&d=retro"
  end

  def avg_participation(grades)
    ((grades.where(participation: 0).count * 100) + (grades.where(participation: 1).count * 50)) / grades.count(:participation)
  end

  def avg_homework(grades)
    ((grades.where(homework: 0).count * 100) + (grades.where(homework: 1).count * 50)) / grades.count(:homework)
  end
end
