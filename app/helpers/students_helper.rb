module StudentsHelper
  def semester_panel_label(semester, courses)
    current_course = courses.where(name: semester.name)
    if current_course.where(current: true).present?
      "info"
    else
      "default"
    end
  end

  def authorized_for_dailygrades(not_enrolled, current_semester)
    not_enrolled == false && (current_semester.teacher_id == current_user.id || current_user.admin?)
  end

  def can_edit_delete(student)
    has_semesters = student.semesters.where(teacher_id: current_user.id)
    if has_semesters.present? || current_user.admin?
      true
    end
  end
end
