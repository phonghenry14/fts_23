class Examination < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, allow_destroy: true

  before_create :init_answers

  def self.check_correct_answers(examination_params_to_check, questions, id)
    correct_answers = 0
    answers_attributes = examination_params_to_check[:answers_attributes]

    answers_attributes.each do |key, value|
      questions.each do |question|
        if(value[:question_id] == question.id.to_s)
          question.options.each do |option|
            if option.correct == true
              flag = option.id.to_s
              if(value[:option_id] == flag)
                correct_answers = correct_answers + 1
              end
            end
          end
        end
      end
    end
    Examination.update(id, correct_answers: correct_answers,
                          status: examination_params_to_check[:status])
  end

  private
  def init_answers
    self.course.questions.sample(20).each do |question|
      self.answers.build question: question
    end
  end
end
