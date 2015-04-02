class Answer < ActiveRecord::Base
  belongs_to :examination
  belongs_to :question
  belongs_to :option

  scope :correct_answers, ->{where(correct: true)}
end
