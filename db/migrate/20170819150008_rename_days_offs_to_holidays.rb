class RenameDaysOffsToHolidays < ActiveRecord::Migration
  def change
    rename_table :days_offs, :holidays
  end
end
