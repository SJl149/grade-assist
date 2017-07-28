class EslClass < ActiveRecord::Base
  belongs_to :user

  has_many :enrollments
  has_many :students, through: :enrollments 
end
