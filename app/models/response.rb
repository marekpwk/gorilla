class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :completed_survey
  belongs_to :choice
end
