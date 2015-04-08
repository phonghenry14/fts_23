class Option < ActiveRecord::Base
  belongs_to :question
  has_many :answers, dependent: :destroy

  scope :option_correct, ->{where(correct: true)}
end
