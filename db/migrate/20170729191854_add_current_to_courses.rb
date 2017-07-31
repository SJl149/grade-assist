class AddCurrentToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :current, :boolean, default: true
  end
end
