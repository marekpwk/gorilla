class User < ActiveRecord::Base
  has_many :surveys
  has_many :completed_surveys
  has_many :responses, through: :completed_surveys
  has_many :choices

  has_secure_password

end
