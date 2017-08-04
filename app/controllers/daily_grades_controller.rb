class DailyGradesController < ApplicationController
  def index
    @daily_grades = DailyGrade.all
  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def destroy

  end

  def attendance
    @course = Course.first
  end

  def class_work
  end

  def homework
  end

  def quizzes
  end

  private

  def grade_params

  end
end
