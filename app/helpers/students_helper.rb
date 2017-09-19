module StudentsHelper
  def semester_panel_label(semester, courses)
    if courses.find_by(name: semester.name).current?
      "info"
    else
      "default"
    end
  end

  def authorized_for_dailygrades(not_enrolled, current_semester)
    not_enrolled == false && (current_semester.teacher_id == current_user.id || current_user.admin?)
  end
end
