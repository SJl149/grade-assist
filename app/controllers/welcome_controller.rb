class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:about, :index]

  def about
  end

  def index
  end

  def dashboard
    @past_courses = current_user.courses.where(:current => false)
    @current_courses = current_user.courses.where(:current => true)
    if current_user.admin?
      @students = Student.all
    else
      @students = Student.where(user: current_user)
    end
  end
end
