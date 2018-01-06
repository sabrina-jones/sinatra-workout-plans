class User < ActiveRecord::Base
  has_many :plans
  has_many :workouts, through: :plans
  # has secure pwd method
  validates :username, presence => true
  has_secure_password
end
