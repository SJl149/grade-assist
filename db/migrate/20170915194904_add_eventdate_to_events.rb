class AddEventdateToEvents < ActiveRecord::Migration
  def change
    add_column :events, :eventdate, :datetime
  end
end
