class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :esl_classes
  # has_many :students, through: :esl_classes, source: :esl_classes

  enum role: [:teacher, :office, :admin]
end
