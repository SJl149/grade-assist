class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:about, :index]

  def about
  end

  def index
  end

  def dashboard
    @courses = Course.all
    @current_courses = current_user.courses.where(:current => true)
    @students = Student.all
  end
end
