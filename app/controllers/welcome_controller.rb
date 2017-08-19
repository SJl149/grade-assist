class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:about, :index]

  def about
  end

  def index
  end

  def dashboard
    @past_courses = current_user.courses.where(:current => false)
    @current_courses = current_user.courses.where(:current => true)
    @students = Student.all
  end
end
