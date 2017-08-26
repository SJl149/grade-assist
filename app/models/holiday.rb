class Holiday < ActiveRecord::Base
  belongs_to :semester

  def start_time
    self.period
  end
end
