class Event < ActiveRecord::Base
  belongs_to :user
  
  def start_time
    self.eventdate
  end
end
