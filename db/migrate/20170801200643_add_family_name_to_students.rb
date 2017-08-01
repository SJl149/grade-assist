class AddFamilyNameToStudents < ActiveRecord::Migration
  def change
    add_column :students, :family_name, :string
  end
end
