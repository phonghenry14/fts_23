class Examination < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, allow_destroy: true

  def self.check_correct_answers(examination_params, examination)
    questions = examination.course.questions
    answers_is_correct = Array.new

    examination_params[:answers_attributes].each do |_, value|
      if value[:correct] == "1"
        answers_is_correct << value[:id].to_i
        break
      end
      question = questions.find value[:question_id].to_i
      if value[:option_id].to_i == question.options.option_correct.first.id
        answers_is_correct << value[:id].to_i
      end
    end

    return answers_is_correct
  end

  def time_length seconds
    minutes = (seconds / 1.minute).floor
    seconds -= minutes.minutes
    "#{minutes} : #{seconds}"
  end

  def self.init_answers (examination)
    if examination.course.hastext?
      choice_questions = Array.new
      text_questions = Array.new

      examination.course.questions.each do |question|
        if question.options.count > 0
          choice_questions << question
        else
          text_questions << question
        end
      end

      choice_questions.sample(17).each do |question|
        Answer.create(question_id: question.id, examination_id: examination.id)
      end

      text_questions.sample(3).each do |question|
        Answer.create(question_id: question.id, examination_id: examination.id)
      end
    else
      examination.course.questions.sample(20).each do |question|
        Answer.create(question_id: question.id, examination_id: examination.id)
      end
    end
  end
end
