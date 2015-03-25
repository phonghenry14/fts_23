class Answer < ActiveRecord::Base
  belongs_to :examination
  belongs_to :question
  belongs_to :option
end
