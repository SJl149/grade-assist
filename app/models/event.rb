class Event < ActiveRecord::Base
  def start_time
    self.eventdate
  end
end
