class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def about
  end

  def index
  end

  def dashboard
  end
end
