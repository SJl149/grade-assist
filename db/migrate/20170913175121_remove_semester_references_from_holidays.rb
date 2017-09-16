class RemoveSemesterReferencesFromHolidays < ActiveRecord::Migration
  def change
    remove_reference :holidays, :semester, index: true, foreign_key: true
  end
end
