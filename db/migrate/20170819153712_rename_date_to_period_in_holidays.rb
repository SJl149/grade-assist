class RenameDateToPeriodInHolidays < ActiveRecord::Migration
  def up
    rename_column :holidays, :date, :period
  end

  def down
    rename_column :holidays, :period, :date
  end
end
