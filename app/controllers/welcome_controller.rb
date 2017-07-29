class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def about
  end

  def index
  end

  def dashboard
    @courses = current_user.courses.where(:current => true)
  end
end
