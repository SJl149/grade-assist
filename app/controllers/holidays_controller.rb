class HolidaysController < ApplicationController
  def index
    @holidays = Holiday.all
  end
end
