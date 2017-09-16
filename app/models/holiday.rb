class Holiday < ActiveRecord::Base
  
  def start_time
    self.period
  end
end
