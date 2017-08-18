class CreateDaysOffs < ActiveRecord::Migration
  def change
    create_table :days_offs do |t|
      t.datetime :date
      t.references :semester, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
